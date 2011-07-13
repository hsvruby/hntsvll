class Category < ActiveRecord::Base
  validates :name, :presence => true

  has_many :categorizations
  has_many :accounts, :through => :categorizations
end
