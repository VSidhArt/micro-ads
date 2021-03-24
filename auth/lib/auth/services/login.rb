module Auth
  module Services
    class Login
      include Import["transactions.users.create_user_session"]
      include Import["repos.user_repo"]

      include Dry::Monads[:result]
      include Dry::Monads::Do.for(:call)

      def call(input)
        user = yield find_user(input)
        user = yield validate_password(input, user)
        make_user_session(user)
      end

      private

      def find_user(input)
        user = user_repo.find_by(email: input[:email])

        if user
          Success(user)
        else
          Failure(:email_or_password_incorrect)
        end
      end

      def validate_password(input, user)
        password_digest = BCrypt::Password.new(user.password_digest)

        if password_digest == input[:password]
          Success(user)
        else
          Failure(:email_or_password_incorrect)
        end
      end


      def make_user_session(user)
        create_user_session.call(user_id: user.id)
      end
    end
  end
end

