class RemoveAccountsCategories < ActiveRecord::Migration
  def self.up
    drop_table :accounts_categories
  end

  def self.down
    create_table :accounts_categories, :id => false do |t|
      t.references :account
      t.references :category
    end

    add_index :accounts_categories, [:account_id, :category_id], :unique => true
  end
end
