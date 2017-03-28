class CreateDepartmentInstructors < ActiveRecord::Migration
  def change
    create_table :department_instructors do |t|

    	t.integer :department_id
    	t.integer :instructor_id

      t.timestamps null: false
    end
  end
end
