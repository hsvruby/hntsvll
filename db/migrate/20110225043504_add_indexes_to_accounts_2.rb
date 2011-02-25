class AddIndexesToAccounts2 < ActiveRecord::Migration
  def self.up
    add_index :accounts, :confirmed_at
  end

  def self.down
    remove_index :accounts, :confirmed_at
  end
end
