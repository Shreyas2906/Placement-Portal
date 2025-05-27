ActiveAdmin.register Application do
  permit_params :status, :student_id, :job_role_id, :resume

  # 🔒 Avoid Ransack trying to filter on resume
  filter :id
  filter :student
  filter :job_role
  filter :status
  filter :created_at

  index do
    selectable_column
    id_column
    column :student
    column :job_role
    column :status
    column :created_at
    column "Resume" do |application|
      if application.resume.attached?
        link_to "Download Resume", rails_blob_path(application.resume, disposition: "attachment"), target: "_blank"
      else
        status_tag "No Resume", class: "status warning"
      end
    end
    actions
  end

  show do
    attributes_table do
      row :id
      row :student
      row :job_role
      row :status
      row :created_at
      row :updated_at
      row "Resume" do |application|
        if application.resume.attached?
          link_to "Download Resume", rails_blob_path(application.resume, disposition: "attachment"), target: "_blank"
        else
          status_tag "No Resume", class: "status warning"
        end
      end
    end
  end

  form do |f|
    f.inputs do
      f.input :student
      f.input :job_role
      f.input :status
      f.input :resume, as: :file
    end
    f.actions
  end
end
