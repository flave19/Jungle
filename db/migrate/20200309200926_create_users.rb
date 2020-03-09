class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string  "name"
      t.string  "email"
      t.string  "password_digest"
      t.string  "created_at",  null: false
      t.string  "updated_at",  null: false
    end
  end
end

# create_table "users", force: :cascade do |t|
#   t.string  "name"
#   t.string  "email"
#   t.string  "password_digest"
#   t.string  "created_at",  null: false
#   t.string  "updated_at",  null: false
# end