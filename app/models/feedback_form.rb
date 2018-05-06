class FeedbackForm < ActiveRecord::Base

	belongs_to :workshop
	has_many :answers

	accepts_nested_attributes_for :answers

	validates_presence_of :name, :register_number

	# validate :check_token

	# private 

	# def check_token
	# 	if !(self.token == self.workshop.token) 
	# 		errors.add(:token, "doesn't match. Enter the valid token")
	# 	end
	# end

end