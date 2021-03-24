module Auth
  module Contracts
    module Users
      class CreateUser < Dry::Validation::Contract
        NAME_FORMAT = %r{\A\w+\z}

        params do
          required(:name).filled(:string)
          required(:email).filled(:string)
          required(:password).filled(:string)
        end

        rule(:name) do
          key.failure('has invalid format') unless NAME_FORMAT.match?(value)
        end
      end
    end
  end
end
