class ManagerRelationship < ActiveRecord::Base
  belongs_to :user, inverse_of: :manager_relationships
  belongs_to :project, inverse_of: :manager_relationships
end
