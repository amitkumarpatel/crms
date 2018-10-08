class Role < ApplicationRecord
  has_many :user_roles
  has_many :users, :through => :user_roles

  validates :name, presence: true

#Rolify.resource_types = ['Super-Manager', 'Manager', 'Client', 'Guest']

# belongs_to :resource,
#            :polymorphic => true,
#            :optional => true


# validates :resource_type,
#           :inclusion => { :in => Rolify.resource_types },
#           :allow_nil => true

# scopify
end