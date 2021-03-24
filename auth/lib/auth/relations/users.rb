module Auth
  module Relations
    class Users < ROM::Relation[:sql]
      schema(:users, infer: true) do
        associations do
          has_many :user_sessions
        end
      end

      def with_sessions
        join(:user_sessions, user_id: :id, priority: 1)
      end
    end
  end
end
