class CreateApplications < ActiveRecord::Migration[7.1]
  def change
    create_table :applications do |t|
      t.string :status
      t.references :student, null: false, foreign_key: true
      t.references :job_role, null: false, foreign_key: true

      t.timestamps
    end
  end
end
