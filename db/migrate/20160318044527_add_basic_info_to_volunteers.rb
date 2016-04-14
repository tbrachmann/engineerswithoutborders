class AddBasicInfoToVolunteers < ActiveRecord::Migration
  def change
    add_column :volunteers, :first_name, :text
    add_column :volunteers, :last_name, :text
    add_column :volunteers, :phone, :text
    add_column :volunteers, :email, :text
    add_column :volunteers, :city, :text
    add_column :volunteers, :state, :text
    add_column :volunteers, :subscribe, :text
    add_column :volunteers, :join_project_team, :text
    add_column :volunteers, :status, :text
    add_column :volunteers, :education, :text
    add_column :volunteers, :major, :text
    add_column :volunteers, :certification, :text
    add_column :volunteers, :languages, :text
    add_column :volunteers, :fluency, :text
    add_column :volunteers, :ewb_exp, :text
    add_column :volunteers, :intl_exp, :text
    add_column :volunteers, :work_exp, :text
    add_column :volunteers, :reason, :text
    add_column :volunteers, :time_invest, :text
    add_column :volunteers, :travel, :text
  end
  
  
end
