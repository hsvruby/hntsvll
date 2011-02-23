class CreateAccountsCategories < ActiveRecord::Migration
  def self.up
    create_table :accounts_categories, :id => false do |t|
      t.references :account
      t.references :category
    end

    add_index :accounts_categories, [:account_id, :category_id], :unique => true
  end

  def self.down
    drop_table :accounts_categories
  end
end
