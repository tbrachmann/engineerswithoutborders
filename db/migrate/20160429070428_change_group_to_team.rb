class ChangeGroupToTeam < ActiveRecord::Migration
  def change
  	rename_column :volunteers, :group, :team
  end
end
