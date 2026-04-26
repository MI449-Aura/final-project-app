class AddRecipeArrayToUserInfo < ActiveRecord::Migration[8.1]
  def change
    add_column :user_infos, :recipes, :integer, default: []
  end
end
