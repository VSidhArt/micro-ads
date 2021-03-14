module Auth
  module Web
    module Controllers
      module Users
        class Create
          include Hanami::Action
          include Import["transactions.users.create_user"]
          include Dry::Monads[:result]

          include Auth::Web::Controllers::Users::Authentication

          def call(params)
            case create_user.call(params.to_h)
            in Success(result)
              self.status = 201
            in Failure(result)
              self.body = { errors: result.errors.to_h }.to_json
              self.status = 422
            end
          end
        end
      end
    end
  end
end
