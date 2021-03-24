module Auth
  module Web
    module Controllers
      module Users
        class Login
          include Hanami::Action
          include Import["services.login"]
          include Dry::Monads[:result]

          def call(params)
            case login.call(params.to_h)
            in Success(result)
              token = JWT.encode(result.uuid, ENV["MASTER_SECRET"])
              meta = { token: token }
              self.status = 201
            in Failure(result)
              p result
              self.body = { errors: result }.to_json
              self.status = 403
            end
          end
        end
      end
    end
  end
end
