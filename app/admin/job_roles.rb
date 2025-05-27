ActiveAdmin.register JobRole do
  permit_params :title, :description, :location, :ctc, :company_id

  index do
    selectable_column
    id_column
    column :title
    column :company
    column :location
    column :ctc
    actions
  end

  filter :title
  filter :company
  filter :location

  form do |f|
    f.inputs do
      f.input :company
      f.input :title
      f.input :description
      f.input :location
      f.input :ctc
    end
    f.actions
  end
end
