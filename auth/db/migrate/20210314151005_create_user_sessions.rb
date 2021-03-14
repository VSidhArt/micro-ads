# frozen_string_literal: true

ROM::SQL.migration do
  change do
    run 'CREATE EXTENSION IF NOT EXISTS "uuid-ossp"'

    create_table :user_sessions do
      primary_key :id
      column :uuid, :uuid

      foreign_key :user_id, :users, null: false

      column :created_at, 'timestamp without time zone', null: false
      column :updated_at, 'timestamp without time zone', null: false
    end
  end
end
