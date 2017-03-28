class Question < ActiveRecord::Base

	has_many :question_types
	
	has_many :answers

end