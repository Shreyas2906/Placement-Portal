# config/initializers/active_storage_ransack.rb

Rails.application.config.to_prepare do
  ActiveStorage::Attachment.class_eval do
    def self.ransackable_attributes(auth_object = nil)
      %w[blob_id created_at id name record_id record_type updated_at]
    end

    def self.ransackable_associations(auth_object = nil)
      []
    end
  end

  ActiveStorage::Blob.class_eval do
    def self.ransackable_attributes(auth_object = nil)
      %w[content_type created_at id filename metadata byte_size checksum service_name updated_at]
    end

    def self.ransackable_associations(auth_object = nil)
      []
    end
  end
end
