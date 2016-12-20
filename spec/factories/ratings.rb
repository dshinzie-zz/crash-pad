FactoryGirl.define do
  factory :rating do
    user
    listing
    score 1
  end
end
