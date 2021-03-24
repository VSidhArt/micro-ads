module Auth
  module Repos
    class UserSessionRepo < ROM::Repository[:user_sessions]
      include Import["container"]

      commands :create,
        use: :timestamps,
        plugins_options: {
          timestamps: {
            timestamps: %i(created_at updated_at)
          }
        }
    end
  end
end
