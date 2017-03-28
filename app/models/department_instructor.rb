class DepartmentInstructor < ActiveRecord::Base

	belongs_to :department
	belongs_to :instructor

end