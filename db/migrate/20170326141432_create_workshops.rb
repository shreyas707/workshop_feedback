class CreateWorkshops < ActiveRecord::Migration
  def change
    create_table :workshops do |t|
      t.string :title
      t.text :description
      t.date :start_date
      t.date :end_date
      t.string :token
      t.integer :user_id
      t.integer :department_id
      t.boolean :allow_access

      t.timestamps null: false
    end
  end
end
