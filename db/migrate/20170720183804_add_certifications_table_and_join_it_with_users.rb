class AddCertificationsTableAndJoinItWithUsers < ActiveRecord::Migration
  def change
    
    create_table :certifications do |t|
      t.string :name
    end

    add_index :certifications, :name, unique: true
    
    create_join_table :users, :certifications do |t|
      t.index :user_id
      t.index :certification_id
    end
    
  end
end
