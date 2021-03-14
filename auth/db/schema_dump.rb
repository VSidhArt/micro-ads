Sequel.migration do
  change do
    create_table(:schema_migrations) do
      String :filename, :text=>true, :null=>false
      
      primary_key [:filename]
    end
    
    create_table(:users) do
      primary_key :id
      String :name, :text=>true, :null=>false
      String :email, :text=>true, :null=>false
      String :password_digest, :text=>true, :null=>false
      DateTime :created_at, :null=>false
      DateTime :updated_at, :null=>false
    end
    
    create_table(:user_sessions) do
      primary_key :id
      String :uuid
      foreign_key :user_id, :users, :null=>false, :key=>[:id]
      DateTime :created_at, :null=>false
      DateTime :updated_at, :null=>false
    end
  end
end
