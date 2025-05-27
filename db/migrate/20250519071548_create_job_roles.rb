class CreateJobRoles < ActiveRecord::Migration[7.1]
  def change
    create_table :job_roles do |t|
      t.string :title
      t.text :description
      t.string :location
      t.string :ctc
      t.references :company, null: false, foreign_key: true
      t.references :admin, null: false, foreign_key: true

      t.timestamps
    end
  end
end
