class RenameManagerToManagers < ActiveRecord::Migration
  def change
    rename_table :manager, :managers
  end
end
