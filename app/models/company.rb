class Company < ApplicationRecord
  has_many :job_roles, dependent: :destroy
  belongs_to :employer, class_name: "Student", foreign_key: "employer_id"

  def self.ransackable_attributes(auth_object = nil)
    %w[
      id
      name
      description
      website
      employer_id 
      created_at
      updated_at
    ]
  end

  def self.ransackable_associations(auth_object = nil)
    ['job_roles'] # add associations you want searchable/filterable
  end
end