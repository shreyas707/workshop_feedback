class CreateWorkshopInstructors < ActiveRecord::Migration
  def change
    create_table :workshop_instructors do |t|
      t.integer :workshop_id
      t.integer :instructor_id

      t.timestamps null: false
    end
  end
end
