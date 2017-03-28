class CreateDepartmentWorkshops < ActiveRecord::Migration
  def change
    create_table :department_workshops do |t|

    	t.integer :workshop_id
    	t.integer :department_id

      t.timestamps null: false
    end
  end
end
