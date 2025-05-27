class RemoveAdminIdFromJobRoles < ActiveRecord::Migration[7.1]
  def change
    remove_column :job_roles, :admin_id, :integer
  end
end
