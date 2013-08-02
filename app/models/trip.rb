class Trip < ActiveRecord::Base
  has_and_belongs_to_many :users
  belongs_to :match, inverse_of: :trip

  validates :official_number, presence: true
  validates :match, presence: true
end
