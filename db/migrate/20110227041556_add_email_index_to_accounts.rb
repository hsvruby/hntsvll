class AddEmailIndexToAccounts < ActiveRecord::Migration
  def self.up
    add_index :accounts, :email
  end

  def self.down
    remove_index :accounts, :email
  end
end
