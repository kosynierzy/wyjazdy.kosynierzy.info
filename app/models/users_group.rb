class UsersGroup < ActiveRecord::Base
  has_and_belongs_to_many :users

  attr_accessible :name

  validates :name, presence: true, uniqueness: true
end
