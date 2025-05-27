class AddRoleToStudents < ActiveRecord::Migration[7.1]
  def change
    add_column :students, :role, :integer, default: 0, null: false
  end
end
