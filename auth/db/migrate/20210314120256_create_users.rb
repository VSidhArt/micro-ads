# frozen_string_literal: true

ROM::SQL.migration do
  change do
    create_table :users do
      primary_key :id
      column :name, String, null: false
      column :email, String, null: false
      column :password_digest, String, null: false

      column :created_at, 'timestamp without time zone', null: false
      column :updated_at, 'timestamp without time zone', null: false
    end
  end
end
