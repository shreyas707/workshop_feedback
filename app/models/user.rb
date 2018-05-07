class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable, :validatable

  def is_admin?
    return true if self.role == "admin"
  end

  def is_staff?
  	return true if self.role == "staff"
  end

  def is_student?
    return true if self.role == "student"
  end

  has_many :workshops
  has_many :feedback_forms
  
  belongs_to :department

  validates_presence_of :username, :email, :password, :password_confirmation, :role

end
