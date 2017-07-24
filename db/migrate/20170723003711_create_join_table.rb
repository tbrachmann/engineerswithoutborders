class CreateJoinTable < ActiveRecord::Migration
  def change

    create_join_table :projects, :certifications do |t|
      t.index :project_id
      t.index :certification_id
    end

    add_index :skills, :name, unique: true
    
  end
end
