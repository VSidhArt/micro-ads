module Auth
  module Web
    module Controllers
      module Users
        module Authentication
          include Dry::Monads[:result]

          AUTH_TOKEN = %r{\ABearer (?<token>.+)\z}

          def self.included(action)
            action.class_eval do
              before :authenticate!
              expose :current_user
            end
          end

          private

          def authenticate!
            auth_user
            halt 401 unless authenticated?
          end

          def authenticated?
            !!current_user
          end

          def current_user
            @current_user ||= auth_user
          end

          def auth_user
            result = Auth::Services::FetchUserService.new.call(extracted_token)

            if result.success?
              @current_user = result.value!
            end
          end

          def extracted_token
            JWT.decode(matched_token, ENV['MASTER_SECRET'])&.first
          rescue JWT::DecodeError
            ''
          end

          def matched_token
            result = auth_header&.match(AUTH_TOKEN)
            return if result.nil? || result.size <= 0

            result[:token]
          end

          def auth_header
            request.get_header('Authorization')
          end
        end
      end
    end
  end
end
