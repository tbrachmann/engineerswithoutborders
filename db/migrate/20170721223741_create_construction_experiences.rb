class CreateConstructionExperiences < ActiveRecord::Migration
  def change
    create_table :construction_experiences do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
