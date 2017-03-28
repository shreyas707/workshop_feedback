class Department < ActiveRecord::Base

	has_many :users

	has_many :users

	has_many :department_instructors
	has_many :instructors, through: :department_instructors

	has_many :department_workshops
	has_many :workshops, through: :department_workshops

end