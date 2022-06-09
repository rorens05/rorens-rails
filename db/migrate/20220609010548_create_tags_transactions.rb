class CreateTagsTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :tags_transactions do |t|
      t.belongs_to :tag
      t.belongs_to :transaction
    end
  end
end
