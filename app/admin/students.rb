ActiveAdmin.register Student do
  permit_params :email, :password, :password_confirmation, :role

  # Add explicit filters here — exclude sensitive Devise fields like reset_password_token
  filter :email
  filter :role, as: :select, collection: Student.roles.keys
  filter :created_at
  filter :updated_at

  form do |f|
    f.inputs "User Details" do
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :role, as: :select, collection: Student.roles.keys
    end
    f.actions
  end

  index do
    selectable_column
    id_column
    column :email
    column :role
    column :created_at
    actions
  end

  show do
    attributes_table do
      row :email
      row :role
      row :created_at
      row :updated_at
    end

    if student.role == "employer"
      panel "Associated Companies" do
        table_for student.companies do
          column :name
          column :website
          column :description
          column :created_at
          column :updated_at
        end
      end
    end
  end

end
