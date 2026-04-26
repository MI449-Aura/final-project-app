class ChangeRecipesToTextInUserInfos < ActiveRecord::Migration[8.1]
  def change
    change_column :user_infos, :recipes, :text
  end
end
