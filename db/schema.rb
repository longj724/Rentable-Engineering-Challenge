ActiveRecord::Schema[7.1].define(version: 2025_04_01_030106) do
  enable_extension "plpgsql"

  create_table "properties", force: :cascade do |t|
    t.string "property_id"
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "bedrooms"
  end

end
