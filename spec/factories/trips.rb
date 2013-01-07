# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :trip do
    match
    official_number 1
    comment "MyText"
    article_url "MyString"
  end
end
