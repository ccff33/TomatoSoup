class SorceryCore < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :username,         :null => false  # if you use another field as a username, for example email, you can safely remove this field.
      t.string :first_name,       :null => false
      t.string :last_name,        :null => false
      t.string :crypted_password, :default => nil
      t.string :salt,             :default => nil

      t.timestamps
    end
  add_index :users, :username, :unique => true
  end

  def self.down
    remove_index :users, :username
    drop_table :users
  end
end