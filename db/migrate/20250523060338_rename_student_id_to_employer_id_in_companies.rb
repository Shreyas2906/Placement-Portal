class RenameStudentIdToEmployerIdInCompanies < ActiveRecord::Migration[7.1]
  def change
    rename_column :companies, :student_id, :employer_id
  end
end
