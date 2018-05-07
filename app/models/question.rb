class Question < ActiveRecord::Base

	has_many :question_types
	
	has_many :answers

	validates_presence_of :title, :question_type_id

end