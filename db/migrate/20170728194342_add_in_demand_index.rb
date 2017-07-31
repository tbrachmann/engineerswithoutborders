class AddInDemandIndex < ActiveRecord::Migration
  def change
    add_index :in_demand, :project_id
    add_index :in_demand, :table_name
    add_index :in_demand, :table_id
  end
end
