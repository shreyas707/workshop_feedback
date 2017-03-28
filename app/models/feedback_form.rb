class FeedbackForm < ActiveRecord::Base

	belongs_to :workshop
	has_many :answers

	accepts_nested_attributes_for :answers

end