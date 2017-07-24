class AddUniqueIndexOnNameToBothExperiences < ActiveRecord::Migration
  def change

    add_index :construction_experiences, :name, unique: true

    add_index :design_experiences, :name, unique: true
    
  end
end
