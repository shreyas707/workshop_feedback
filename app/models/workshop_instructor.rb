class WorkshopInstructor < ActiveRecord::Base

	belongs_to :instructor
	belongs_to :workshop

end