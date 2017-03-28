class RemoveDepartmentIdFromWorkshop < ActiveRecord::Migration
  def change
  
  	remove_column :workshops, :department_id	 

  end
end
