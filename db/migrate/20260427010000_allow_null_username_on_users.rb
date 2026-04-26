class AllowNullUsernameOnUsers < ActiveRecord::Migration[8.1]
  def up
    return unless column_exists?(:users, :username)

    change_column_null :users, :username, true
  end

  def down
    return unless column_exists?(:users, :username)

    execute("UPDATE users SET username = email_address WHERE username IS NULL")
    change_column_null :users, :username, false
  end
end
