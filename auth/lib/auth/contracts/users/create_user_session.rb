module Auth
  module Contracts
    module Users
      class CreateUserSession < Dry::Validation::Contract

        params do
          required(:uuid).filled(:string)
          required(:user_id).filled(:integer)
        end
      end
    end
  end
end
