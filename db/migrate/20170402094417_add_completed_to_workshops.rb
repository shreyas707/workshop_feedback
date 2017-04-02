class AddCompletedToWorkshops < ActiveRecord::Migration
  def change

  	add_column :workshops, :complete, :boolean

  end
end
