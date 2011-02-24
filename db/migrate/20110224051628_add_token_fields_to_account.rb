class AddTokenFieldsToAccount < ActiveRecord::Migration
  def self.up
    add_column :accounts, :token, :string
    add_column :accounts, :token_expires_at, :datetime
  end

  def self.down
    remove_column :accounts, :token_expires_at
    remove_column :accounts, :token
  end
end
