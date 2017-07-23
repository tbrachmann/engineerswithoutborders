class CreateDesignExperiences < ActiveRecord::Migration
  def change
    create_table :design_experiences do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
