class QuestionType < ActiveRecord::Base

	belongs_to :question

	validates_presence_of :name

end