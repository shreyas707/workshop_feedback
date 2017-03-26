class CreateInstructors < ActiveRecord::Migration
  def change
    create_table :instructors do |t|
      t.string :name
      t.string :mobile
      t.string :email
      t.text :address
      t.string :profile
      t.integer :department_id

      t.timestamps null: false
    end
  end
end
