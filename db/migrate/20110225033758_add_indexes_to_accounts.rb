class AddIndexesToAccounts < ActiveRecord::Migration
  def self.up
    add_index :accounts, :first_name
    add_index :accounts, :last_name
    add_index :accounts, :created_at
    add_index :accounts, :token
  end

  def self.down
    remove_index :accounts, :first_name
    remove_index :accounts, :last_name
    remove_index :accounts, :created_at
    remove_index :accounts, :token
  end
end
