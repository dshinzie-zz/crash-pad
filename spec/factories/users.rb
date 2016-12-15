FactoryGirl.define do
  factory :user do
    sequence :email do |n|
      "person#{n}@example.com"
    end
    phone "MyString"
    password_digest "MyString"
    first_name "MyString"
    last_name "MyString"
    api_key "MyText"
    avatar_url "MyString"
    role 1
  end
end
