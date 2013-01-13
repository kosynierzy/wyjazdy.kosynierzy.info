class Season < ActiveRecord::Base
  has_many :matches

  attr_accessible :name

  validates :name, presence: true, uniqueness: true
end
