ActiveAdmin.register Company do
  permit_params :name, :description, :website, :employer_id

  index do
    selectable_column
    id_column
    column :name
    column :website
    column("Employer") { |company| company.employer&.email }
    actions
  end

  filter :name
  filter :website
  filter :employer, collection: -> { Student.where(role: :employer).map { |s| [s.email, s.id] } }

  form do |f|
    f.inputs do
      f.input :name
      f.input :description
      f.input :website
      f.input :employer, as: :select, collection: Student.where(role: :employer).map { |s| [s.email, s.id] }, label: "Employer"
    end
    f.actions
  end
end
