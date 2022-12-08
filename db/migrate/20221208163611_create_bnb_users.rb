class CreateBnbUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :bnb_users do |t|
      t.string :email
      t.string :full_name
      t.string :username
      t.string :avatar
      t.string :password_digest
      t.string :account_type

      t.timestamps
    end
  end
end
