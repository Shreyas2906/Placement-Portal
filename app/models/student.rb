class Student < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :applications, dependent: :destroy
  has_one_attached :resume
  has_many :companies, foreign_key: "employer_id", dependent: :destroy

  enum role: { student: 0, admin: 1, employer: 2 }

  validates :role, presence: true

  after_initialize :set_default_role, if: :new_record?

  # Whitelist associations for Ransack searches/filters in ActiveAdmin
  def self.ransackable_associations(auth_object = nil)
    %w[applications resume_attachment resume_blob]
  end

  # Whitelist attributes for Ransack filtering
  def self.ransackable_attributes(auth_object = nil)
    %w[
      id
      email
      role
      created_at
      updated_at
      reset_password_sent_at
      remember_created_at
      # Add other columns you want searchable here
    ]
  end

  private

  def set_default_role
    self.role ||= :student
  end
end
