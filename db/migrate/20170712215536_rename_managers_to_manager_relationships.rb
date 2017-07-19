class RenameManagersToManagerRelationships < ActiveRecord::Migration
  def change
    rename_table :managers, :manager_relationships
  end
end
