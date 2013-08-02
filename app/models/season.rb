class Season < ActiveRecord::Base
  has_many :matches

  validates :name, presence: true, uniqueness: true
end
