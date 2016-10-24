class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.string :description
      t.int :projDay
      t.int :projTime
      t.int :volunteersNeeded
      t.string :projLocation
      
      t.timestamps null: false
    end
  end
end
