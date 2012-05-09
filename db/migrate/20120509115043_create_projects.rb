class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name,           :null => false
      t.text :description
      t.references :user,       :null => false
      t.timestamps
    end
    add_index :projects, :user_id
  end
end
