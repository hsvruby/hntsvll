class Categorization < ActiveRecord::Base
  belongs_to :account
  belongs_to :category
  
  validates :account, :category, :presence => true
end
