class Match < ActiveRecord::Base
  belongs_to :season
  has_one :trip, inverse_of: :match
  accepts_nested_attributes_for :trip

  validates :home_team, presence: true
  validates :away_team, presence: true
  validates :date, presence: true
  validates :season, presence: true
  validates :game_type, presence: true

  before_destroy :check_for_trip

  private

  def check_for_trip
    if trip.present?
      errors.add(:base, 'cannot delete match while trip exists')
      return false
    end
  end
end
