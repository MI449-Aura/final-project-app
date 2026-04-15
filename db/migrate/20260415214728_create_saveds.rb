class CreateSaveds < ActiveRecord::Migration[8.1]
  def change
    create_table :saveds do |t|
      t.string :username
      t.integer :recipe_id

      t.timestamps
    end
  end
end
