class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable, :validatable

  def is_admin?
    return true if self.role == "admin"
  end

  def is_user?
  	return true if self.role == "user"
  end

  has_many :workshops

  belongs_to :department

  validates_presence_of :username, :email, :password, :password_confirmation, :role, :department_id

end
