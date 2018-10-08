class User < ApplicationRecord
  #rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,:confirmable,
         :recoverable, :rememberable, :validatable

  has_many :user_roles
  has_many :roles, through: :user_roles
  has_many :bookings
  #after_create :assign_default_role

  def assign_default_role
    self.add_role(:guest) if self.roles.blank?
  end

	def super_manager?
	  has_role?(:super_manager)
	end
	 
	def manager?
	  has_role?(:manager)
	end

	def client?
	  has_role?(:client)
	end 

	def guest?
	  has_role?(:guest)
	end

end
