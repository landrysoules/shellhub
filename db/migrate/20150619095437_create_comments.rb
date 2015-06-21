class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :text
      t.belongs_to :user, index: true
      t.belongs_to :snipet, index: true
      t.timestamps null: false
    end
  end
end
