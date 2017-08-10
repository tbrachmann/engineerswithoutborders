class Role < ActiveRecord::Base
  has_many :users
  
  def self.get_role(id)
      if Role.exists? id
          return Role.find(id)
      else
          return nil
      end
  end
  
  def self.ransackable_attributes(auth_object = nil)
    ['name']
  end

  validates :name, presence: true, allow_blank: false
  
end
