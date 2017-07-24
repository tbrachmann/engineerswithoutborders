class CreateAvailabilityTable < ActiveRecord::Migration
  def change
    create_table :availability do |t|
      t.boolean :monday_morning, null: false
      t.boolean :monday_afternoon, null: false
      t.boolean :monday_evening, null: false
      
      t.boolean :tuesday_morning, null: false
      t.boolean :tuesday_afternoon, null: false
      t.boolean :tuesday_evening, null: false

      t.boolean :wednesday_morning, null: false
      t.boolean :wednesday_afternoon, null: false
      t.boolean :wednesday_evening, null: false
      
      t.boolean :thursday_morning, null: false
      t.boolean :thursday_afternoon, null: false
      t.boolean :thursday_evening, null: false

      t.boolean :friday_morning, null: false
      t.boolean :friday_afternoon, null: false
      t.boolean :friday_evening, null: false
      
      t.boolean :saturday_morning, null: false
      t.boolean :saturday_afternoon, null: false
      t.boolean :saturday_evening, null: false

      t.boolean :sunday_morning, null: false
      t.boolean :sunday_afternoon, null: false
      t.boolean :sunday_evening, null: false
      
      t.integer :user_id
      

    end
  end
end
