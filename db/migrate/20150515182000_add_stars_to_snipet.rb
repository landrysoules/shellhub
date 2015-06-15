class AddStarsToSnipet < ActiveRecord::Migration
  def change
    create_table :stars do |t|
      t.belongs_to :user, index: true
      t.belongs_to :snipet, index: true
      t.timestamps null: false
    end
  end
end
