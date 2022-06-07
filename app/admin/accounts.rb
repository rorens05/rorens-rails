ActiveAdmin.register Account do
  permit_params :account_name, :account_number, :name, :user_id
  filter :user

  index do
    selectable_column
    column :amount do |account|
      para format_currency(account.amount), style: 'text-align: right;width: 80px; margin: 0'
    end
    column :name
    column :user
    actions
  end
end
