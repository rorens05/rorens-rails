class RemoveBankIdFromAccounts < ActiveRecord::Migration[6.0]
  def change
    remove_column :accounts, :bank_id
  end
end
