class CreateSnipets < ActiveRecord::Migration
  def change
    create_table :snipets do |t|
      t.string :title
      t.string :content
      t.string :execution_output

      t.timestamps null: false
    end
  end
end
