class AddDepartmentIdToWorkshops < ActiveRecord::Migration
  def change
  	add_column :workshops, :department_id, :integer
  end
end
