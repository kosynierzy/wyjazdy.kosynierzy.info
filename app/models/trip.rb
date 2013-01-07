class Trip < ActiveRecord::Base
  belongs_to :match
  attr_accessible :article_url, :comment, :official_number

  validates :match_id, presence: true
  validates :official_number, presence: true
end
