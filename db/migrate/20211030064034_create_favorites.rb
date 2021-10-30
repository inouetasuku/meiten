class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites do |t|
      t.integer :favoriting_id, null: false
      t.integer :favorited_id, null: false

      t.timestamps
    end
  end
end
