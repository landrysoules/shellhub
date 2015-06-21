class ChangeComments < ActiveRecord::Migration
  def change
    change_column_null :comments, :text, false
    change_column_null :comments, :user_id, false
    change_column_null :comments, :snipet_id, false
  end
end
