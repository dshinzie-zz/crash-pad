class Seed
  def self.start
    seed = Seed.new
    seed.create_users
    # seed.create_admins
    seed.create_listings
  end

  def create_users
    50.times do |i|
      user = User.create!(
        email: Faker::Internet.email,
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        phone: Faker::Number.number(10),
        password_digest: "password",
        api_key: nil,
        avatar_url: nil,
        role: 0)

      puts "User #{i}: #{user.email} created!"
    end
  end

  def create_admins
    50.times do |i|
      user = User.create!(
        email: Faker::Internet.email,
        first_name: "admin" + Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        phone: Faker::PhoneNumber.phone_number,
        password_digest: "password",
        api_key: nil,
        avatar_url: nil,
        role: 1)

      puts "User #{i}: #{user.email} created!"
    end
  end

  def create_listings
    100.times do |i|
      listing = Listing.create!(
        user: User.find(Random.new.rand(1..50)),
        description: Faker::Lorem.paragraph,
        image_url: Faker::Avatar.image,
        latitude: 39.75098438029149,
        longitude: -104.9987568197085,
        price: Faker::Number.decimal(3,2),
        accomodation: Faker::Number.number(2))

      puts "Listing #{i}: listing for host #{listing.user.first_name} created!"
    end
  end

  Seed.start
end
