class CreateSkills < ActiveRecord::Migration

  def change
    create_table :skills do |t|
      t.belongs_to :user, index: true

      t.string :name
      t.string :description
      
      t.timestamps
    end
  end
end
