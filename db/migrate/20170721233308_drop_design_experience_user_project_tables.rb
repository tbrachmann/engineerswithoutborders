class DropDesignExperienceUserProjectTables < ActiveRecord::Migration
  def change
    drop_table :user_design_experiences
    drop_table :project_design_experiences
  end
end
