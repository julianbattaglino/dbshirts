# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :product do
    url "MyString"
    title "MyString"
    category_id 1
    price 1
  end
end
