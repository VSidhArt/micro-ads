Auth::Application.boot(:core) do
  init do
    require 'bcrypt'
    require "dry/monads"
    require "dry/monads/do"
    require "dry-validation"

    if ['test', 'development'].include? ENV['APP_ENV']
      require 'pry'
    end
  end

  start do
    Dry::Validation.load_extensions(:monads)
  end
end
