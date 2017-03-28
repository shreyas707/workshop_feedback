class DepartmentWorkshop < ActiveRecord::Base

	belongs_to :department
	belongs_to :workshop

end