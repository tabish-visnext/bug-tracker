class User < ApplicationRecord
    has_many :bugs   

    has_many :user_projects
    has_many :projects, through: :user_projects
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  
  enum role: [:manager, :developer, :qa]
  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= current_user.role
  end 
  
end