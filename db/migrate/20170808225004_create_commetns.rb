class CreateCommetns < ActiveRecord::Migration[5.0]
  def change
    create_table :commetns do |t|
      t.text :content
      t.references :user, foreign_key: true
      t.references :blog, foreign_key: true

      t.timestamps
    end
  end
end
