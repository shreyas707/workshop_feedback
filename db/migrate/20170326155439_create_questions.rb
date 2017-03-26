class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title
      t.integer :order
      t.integer :question_type_id

      t.timestamps null: false
    end
  end
end
