class ChangeProjectsUsersToVolunteerRelationship < ActiveRecord::Migration
  def change
    drop_table :projects_users

    create_table :volunteer_relationships do |t|
      t.belongs_to :user, index: true
      t.belongs_to :project, index: true
      t.string :role
    end
    
  end
end
