Sequel.migration do
  up do
    create_table(:ads) do
      primary_key :id
      String :title, null: false
      String :description, null: false, text: true
      String :city, null: false
      Float :lat
      Float :lon
      BigDecimal :user_id, null: false
      DateTime :created_at, null: false, default: Sequel.lit("now()")
      DateTime :updated_at, null: false, default: Sequel.lit("now()")
    end
  end

  down do
    drop_table :ads
  end
end
