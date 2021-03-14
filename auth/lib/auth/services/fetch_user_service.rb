module Auth
  module Services
    class FetchUserService

      include Dry::Monads[:result]
      include Import["repos.user_repo"]

      def call(uuid)
        user = user_repo.find_by_session_uuid(uuid)

        if user
          Success(user)
        else
          Failure(:session_not_found)
        end
      end

    end
  end
end
