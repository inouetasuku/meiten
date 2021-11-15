class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites do |t|
      t.references :favoriting, foreign_key: true
      t.references :favorited, foreign_key: { to_table: :users}

      t.timestamps

      t.index [:favoriting_id, :favorited_id], unique: true
    end
  end
end
