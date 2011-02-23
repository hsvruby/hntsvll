class AddEmailToAccounts < ActiveRecord::Migration
  def self.up
    add_column :accounts, :email, :string
  end

  def self.down
    remove_column :accounts, :email
  end
end
