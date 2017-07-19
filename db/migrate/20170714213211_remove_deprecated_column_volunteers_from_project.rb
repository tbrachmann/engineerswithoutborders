class RemoveDeprecatedColumnVolunteersFromProject < ActiveRecord::Migration
  def change
    remove_column :projects, :volunteers
  end
end
