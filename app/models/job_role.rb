class JobRole < ApplicationRecord
  belongs_to :company
  has_many :applications, dependent: :destroy

  def self.ransackable_attributes(auth_object = nil)
    %w[
      id
      title
      description
      company_id
      created_at
      updated_at
      location
      ctc
      id_value
    ]
  end

  def self.ransackable_associations(auth_object = nil)
    %w[applications company]
  end
end
