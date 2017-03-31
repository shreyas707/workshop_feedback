class Workshop < ActiveRecord::Base

	belongs_to :user

	has_many :feedback_forms

	has_many :workshop_instructors
	has_many :instructors, through: :workshop_instructors

	has_many :department_workshops
	has_many :departments, through: :department_workshops

	validates_presence_of :title, :description
	validate :check_date_validity

	def check_date_validity
		if self.end_date < self.start_date
			errors.add(:end_date, "should be greater than start date")
		end
	end
end