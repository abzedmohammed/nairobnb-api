class CreateBnbRooms < ActiveRecord::Migration[7.0]
  def change
    create_table :bnb_rooms do |t|
      t.string :name
      t.string :address
      t.string :bnb_type
      t.integer :price
      t.string :bnb_image
      t.text :features
      t.integer :bed
      t.integer :size
      t.boolean :wifi
      t.boolean :electronics
      t.boolean :booked
      t.belongs_to :bnb_user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
