# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :joke_content do
    title "MyString"
    content "MyText"
    like_count 1
    dislike_count 1
  end
end
