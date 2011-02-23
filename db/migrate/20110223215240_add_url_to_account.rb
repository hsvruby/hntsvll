class AddUrlToAccount < ActiveRecord::Migration
  def self.up
    add_column :accounts, :page_url, :string
  end

  def self.down
    remove_column :accounts, :page_url
  end
end
