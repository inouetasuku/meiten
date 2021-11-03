class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.string :password, null: false
      t.string :name, null: false
      t.integer :heat, null: false
      t.integer :location, null: false
      t.string :location_detail, null: false
      t.integer :sex, null: false
      t.integer :age, null: false
      t.string :hobby
      t.string :special_skill
      t.string :office
      t.integer :history_art
      t.text :self_introduction, null: false
      
      t.boolean :delete_flg
      t.timestamps
    end
  end
end
