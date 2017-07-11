class Project < ActiveRecord::Base
  has_many :events
  has_and_belongs_to_many :users
  belongs_to :manager, :class_name => 'User', :foreign_key => 'manager_id'
  has_attached_file :image, styles: { large: "600x600>", medium: "300x300>", thumb: "150x150#" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
