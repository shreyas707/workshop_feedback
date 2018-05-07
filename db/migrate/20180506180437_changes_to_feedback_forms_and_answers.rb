class ChangesToFeedbackFormsAndAnswers < ActiveRecord::Migration
  def change
  	remove_column :workshops, :token
  	remove_column :feedback_forms, :name
  	remove_column :feedback_forms, :register_number

  	add_column :feedback_forms, :user_id, :integer
  end
end
