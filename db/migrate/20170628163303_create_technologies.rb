class CreateTechnologies < ActiveRecord::Migration[5.0]
  def change
    create_table "technologies", force: :cascade do |t|
    t.string   "name"
    t.integer  "portfolio_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["portfolio_id"], name: "index_technologies_on_portfolio_id", using: :btree
  end
  end
end
