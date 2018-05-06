class RemoveTokenFromFeedbackForm < ActiveRecord::Migration
  def change
  	remove_column :feedback_forms, :token
  end
end
