class Categorization < ActiveRecord::Base
  belongs_to :account
  belongs_to :category
  
  validates :account_id, :category_id, :presence => true
end
