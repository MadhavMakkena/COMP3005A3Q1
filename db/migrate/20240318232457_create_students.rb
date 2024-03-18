class CreateStudents < ActiveRecord::Migration[7.1]
  def change
    create_table :students do |t|
      t.integer :student_id
      t.string :first_name
      t.string :last_name
      t.string :email
      t.date :enrollment_date

      t.timestamps
    end
    add_index :students, :student_id, unique: true
    add_index :students, :email, unique: true
  end
end
