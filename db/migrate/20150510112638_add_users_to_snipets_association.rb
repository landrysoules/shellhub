class AddUsersToSnipetsAssociation < ActiveRecord::Migration
  def change
    add_reference :snipets, :user, index: true, foreign_key: true
  end
end
