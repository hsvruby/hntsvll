class Account < ActiveRecord::Base
  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :email, :presence => true, :uniqueness => true

  has_and_belongs_to_many :categories

  def full_name
    "#{first_name} #{last_name}"
  end
end
