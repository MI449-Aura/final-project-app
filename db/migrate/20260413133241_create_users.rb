class CreateUsers < ActiveRecord::Migration[8.1]
  def change
    create_table :users do |t|
      t.string :email_address, null: false
      t.string :username, null: false
      t.string :password_digest, null: false
      t.integer :recipe_one_id
      t.integer :recipe_two_id
      t.integer :recipe_third_id

      t.timestamps
    end
    add_index :users, :email_address, unique: true
  end
end
