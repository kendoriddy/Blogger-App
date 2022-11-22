class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.references :author, index: true, null: false, foreign_key: { to_table: :user }
      t.references :post, null: false, foreign_key: true

      t.timestamps
    end
  end
end
