module Auth
  module Contracts
    module Users
      class LoginInput < Dry::Validation::Contract

        params do
          required(:email).filled(:string)
          required(:password).filled(:string)
        end
      end
    end
  end
end
