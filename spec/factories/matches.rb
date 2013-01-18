# encoding: utf-8
# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :match do
    date "2013-01-07"
    home_team "Anwil"
    home_score 95
    away_team "Śląsk"
    away_score 102
    game_type "PLK"
    season
    won true
  end
end
