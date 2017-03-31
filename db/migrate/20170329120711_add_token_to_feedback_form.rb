class AddTokenToFeedbackForm < ActiveRecord::Migration
  def change

	add_column :feedback_forms, :token, :string

  end
end
