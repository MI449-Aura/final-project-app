class CreateUserInfos < ActiveRecord::Migration[8.1]
  def change
    create_table :user_infos do |t|
      t.string :username
      t.integer :r_one
      t.integer :r_two
      t.integer :r_three

      t.timestamps
    end
  end
end
