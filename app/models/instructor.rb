class Instructor < ActiveRecord::Base

	has_many :workshop_instructors
	has_many :workshops, through: :workshop_instructors

	has_many :department_instructors
	has_many :departments, through: :department_instructors

end