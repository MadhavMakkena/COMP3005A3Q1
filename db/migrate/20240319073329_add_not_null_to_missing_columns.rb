class AddNotNullToMissingColumns < ActiveRecord::Migration[7.1]
  def change
    change_column_null :students, :first_name, false
    change_column_null :students, :last_name, false
    change_column_null :students, :email, false
  end
end
