module Auth
  module Transactions
    module Users
      class CreateUserSession
        include Dry::Monads[:result]
        include Dry::Monads::Do.for(:call)

        include Import["contracts.users.create_user_session"]
        include Import["repos.user_session_repo"]


        def call(input)
          input = input.merge!(uuid: SecureRandom.uuid)
          values = yield validate(input)
          user_session = yield persist(values)

          Success(user_session)
        end

        def validate(params)
          create_user_session.call(params).to_monad
        end

        def persist(result)
          Success(user_session_repo.create(result.values))
        end
      end
    end
  end
end
