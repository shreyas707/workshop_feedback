class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.text :feedback
      t.integer :question_id
      t.integer :feedback_form_id

      t.timestamps null: false
    end
  end
end
