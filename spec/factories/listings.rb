FactoryGirl.define do
  factory :listing do
    user
    description
    image_url "MyText"
    latitude 1.5
    longitude 1.5
    price 1.5
    accomodation 1
  end
  sequence :description do |n|
    "Description #{n}"
  end
end
