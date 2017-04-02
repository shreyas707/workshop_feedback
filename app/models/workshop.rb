class Workshop < ActiveRecord::Base

	belongs_to :user

	has_many :feedback_forms

	has_many :workshop_instructors
	has_many :instructors, through: :workshop_instructors

	has_many :department_workshops
	has_many :departments, through: :department_workshops

	validates_presence_of :title, :description
	validate :check_date_validity, :is_complete?

	def check_date_validity
		if self.end_date < self.start_date
			errors.add(:end_date, "should be greater than start date")
		end
	end

	def is_complete?
		if self.end_date < Date.today
			self.complete = true
		end
		if self. complete == true
			self.allow_access = false
		end
	end

end

	# def is_complete?
	# 	Workshop.all.each do |workshop|
	# 		if workshop.end_date < Date.today
	# 			workshop.complete = true
	# 		end
	# 	end
	# end