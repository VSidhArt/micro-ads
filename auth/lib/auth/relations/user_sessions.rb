module Auth
  module Relations
    class UserSessions < ROM::Relation[:sql]
      schema(:user_sessions, infer: true) do
        attribute :user_id, Types::ForeignKey(:users)
        associations do
          belongs_to :user
        end
      end
    end
  end
end
