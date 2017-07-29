class CreateInDemand < ActiveRecord::Migration
  def change
    create_table :in_demand do |t|
      t.integer :project_id
      t.string :table_name
      t.integer :table_id
    end
  end
end
