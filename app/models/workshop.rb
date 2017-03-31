class Workshop < ActiveRecord::Base

	belongs_to :user

	has_many :feedback_forms

	has_many :workshop_instructors
	has_many :instructors, through: :workshop_instructors

	has_many :department_workshops
	has_many :departments, through: :department_workshops

	validates_presence_of :title, :description

end