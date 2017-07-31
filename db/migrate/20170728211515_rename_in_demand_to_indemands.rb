class RenameInDemandToIndemands < ActiveRecord::Migration
  def change
    rename_table :in_demand, :in_demands
  end
end
