class AddArchiveFlagToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :archive_flag, :boolean, :default => false
  end
end
