class DropProjectSkillTable < ActiveRecord::Migration
  def change
      drop_table :projects_skills
  end
end
