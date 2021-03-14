module Auth
  module Transactions
    module Users
      class CreateUser
        include Dry::Monads[:result]
        include Dry::Monads::Do.for(:call)

        include Import["contracts.users.create_user"]
        include Import["repos.user_repo"]


        def call(input)
          values = yield validate(input)

          user = yield persist(values)

          Success(user)
        end

        def validate(params)
          create_user.call(params).to_monad
        end

        def persist(result)
          values = result.values.merge!(password_digest: make_password_hash(result.values[:password]))
          Success(user_repo.create(values))
        end

        private

        def make_password_hash(password)
          BCrypt::Password.create(password)
        end
      end
    end
  end
end
