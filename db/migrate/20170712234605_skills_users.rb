class SkillsUsers < ActiveRecord::Migration
  def change
    create_table :skills_users, :id => false do |t|
      t.integer :skill_id
      t.integer :user_id
    end
  end
end
