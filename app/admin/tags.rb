ActiveAdmin.register Tag do

  menu parent: "Settings"

  permit_params :name, :description, :status

  index do
    selectable_column
    id_column
    column :name
    column :status do |tag|
      status_tag tag.status
    end
    actions
  end

  show do |tag|
    attributes_table do
      row :name
      row :description
      row :status do |tag|
        status_tag tag.status
      end
    end
  end
  
end
