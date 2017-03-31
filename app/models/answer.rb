class Answer < ActiveRecord::Base

	belongs_to :question
	belongs_to :feedback_form

end