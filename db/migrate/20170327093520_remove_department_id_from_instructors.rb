class RemoveDepartmentIdFromInstructors < ActiveRecord::Migration
  def change
  
  	remove_column :instructors, :department_id	 

  end
end
