class Role < ActiveRecord::Base
  has_many :users
  
  def self.get_role(role_ids)
      total = []
      if role_ids
          role_ids.each do |x|
              if Role.exists? x
                  total << Role.find(x)
              end
          end
          return total
      else
          return []
      end
  end
  
  def self.ransackable_attributes(auth_object = nil)
    ['name']
  end

  validates :name, presence: true, allow_blank: false
  
end
