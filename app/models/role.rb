class Role < ActiveRecord::Base
  belongs_to :users

  def self.ransackable_attributes(auth_object = nil)
    ['name']
  end
  
end
