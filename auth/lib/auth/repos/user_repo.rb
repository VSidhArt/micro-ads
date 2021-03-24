module Auth
  module Repos
    class UserRepo < ROM::Repository[:users]
      include Import["container"]

      commands :create,
        use: :timestamps,
        plugins_options: {
          timestamps: {
            timestamps: %i(created_at updated_at)
          }
        }

      def all
        users.to_a
      end

      def find_by_session_uuid(uuid)
        user_sessions.where(uuid: uuid).limit(1).to_a.last
      end

      def find_by(params)
        users.where(params).limit(1).to_a.last
      end
    end
  end
end
