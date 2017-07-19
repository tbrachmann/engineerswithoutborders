class RemoveRoleFromVolunteerRelationship < ActiveRecord::Migration
  def change
    remove_column :volunteer_relationships, :role, type: :string
  end
end
