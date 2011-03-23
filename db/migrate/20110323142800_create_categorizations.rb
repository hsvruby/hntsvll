class CreateCategorizations < ActiveRecord::Migration
  def self.up
    create_table :categorizations do |t|
      t.references :account, :null => false
      t.references :category, :null => false
    end
    add_index :categorizations, [:account_id, :category_id], :unique => true
  end

  def self.down
    drop_table :categorizations
  end
end
