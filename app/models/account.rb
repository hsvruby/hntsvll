class Account < ActiveRecord::Base
  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :email, :presence => true, :uniqueness => true

  validate :has_at_least_one_category
  validate :has_no_more_than_two_categories

  has_and_belongs_to_many :categories

  def full_name
    "#{first_name} #{last_name}"
  end

  private

  def has_at_least_one_category
    errors[:categories] << "must choose at least one category" if categories.length < 1
  end

  def has_no_more_than_two_categories
    errors[:categories] << "cannot choose more than two categories" if categories.length > 2
  end
end
