class CreateFeedbackForms < ActiveRecord::Migration
  def change
    create_table :feedback_forms do |t|
      t.string :name
      t.string :register_number
      t.integer :workshop_id

      t.timestamps null: false
    end
  end
end
