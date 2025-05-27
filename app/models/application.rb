class Application < ApplicationRecord
  belongs_to :student
  belongs_to :job_role

  has_one_attached :resume  # Add this line

  validates :status, inclusion: { in: %w[pending shortlisted rejected hired] }

  # Optional: validate presence of resume on create
  validates :resume, presence: true, on: :create

  # Allowlist attributes for Ransack filtering
  def self.ransackable_attributes(auth_object = nil)
    %w[
      id
      status
      student_id
      job_role_id
      created_at
      updated_at
    ]
  end

  # Allowlist associations for Ransack filtering
  def self.ransackable_associations(auth_object = nil)
    %w[student job_role]
  end
end
