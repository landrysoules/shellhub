class AddUsernameToSnipets < ActiveRecord::Migration
  def change
    add_column :snipets, :username, :string
  end
end
