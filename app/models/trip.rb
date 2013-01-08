class Trip < ActiveRecord::Base
  belongs_to :match
  attr_accessible :article_url, :comment, :official_number

  validates :official_number, presence: true
end
