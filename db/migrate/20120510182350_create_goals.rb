class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.string :name,             :null => false
      t.integer :estimated_time,  :default => 0
      t.integer :real_time,       :default => 0
      t.boolean :accomplished,    :default => false
      t.references :project,      :null => false

      t.timestamps
    end
    add_index :goals, :project_id
  end
end
