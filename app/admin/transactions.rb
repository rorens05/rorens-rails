ActiveAdmin.register Transaction do

  permit_params :account_id, :category_id, :amount, :note, :schedule, :status, :image, tag_ids: []
  
  filter :account
  filter :category
  filter :schedule

  form do |f|  
    f.semantic_errors *f.object.errors.keys
    f.input :image, as: :file
    f.input :account, member_label: :label_name, include_blank: false
    f.input :category
    f.input :tags
    f.input :amount
    f.input :note
    f.input :schedule, as: :datetime_picker
    f.input :status
    f.actions
  end

  index do
    selectable_column
    id_column
    column :note
    column :account
    column :category
    column :amount do |transaction|
      format_currency(transaction.amount)
    end
    
    column :type, sortable: "categories.transaction_type" do |transaction|
      status_tag transaction.category.transaction_type
    end
    column :schedule
    
    actions
  end 

  show do |transaction|
    attributes_table do
      row :note
      row :account
      row :category
      row :tags
      row :amount do |transaction|
        format_currency(transaction.amount)
      end
      row :type do |transaction|
        status_tag transaction.category.transaction_type
      end
      row :schedule
      row :status do |transaction|
        status_tag transaction.status
      end
    end
  end

  controller do
    def scoped_collection
      end_of_association_chain.includes(:category)
    end
  end
end
