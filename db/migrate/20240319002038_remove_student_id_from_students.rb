class RemoveStudentIdFromStudents < ActiveRecord::Migration[7.1]
  def change
    remove_column :students, :student_id, :integer
  end
end
