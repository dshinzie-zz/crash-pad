class Seed
  def self.start
    seed = Seed.new
    seed.create_users
    # seed.create_admins
    seed.create_listings
  end

  def create_users
    25.times do |i|
      user = User.create!(
        email: Faker::Internet.email,
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        phone: Faker::Number.number(10),
        password_digest: "password",
        api_key: nil,
        avatar_url: "stock.jpg",
        role: 0)

      puts "User #{i}: #{user.email} created!"
    end
  end

  def create_admins
    25.times do |i|
      user = User.create!(
        email: Faker::Internet.email,
        first_name: "admin" + Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        phone: Faker::PhoneNumber.phone_number,
        password_digest: "password",
        api_key: nil,
        avatar_url: "stock.jpg",
        role: 1)

      puts "Admin #{i}: #{user.email} created!"
    end
  end

  def create_listings
    50.times do |i|
      listing = Listing.create!(
        user: User.find(rand(1..24)),
        description: Faker::Lorem.paragraph,
        image_url: "apt#{rand(1..5)}.jpg",
        latitude: Faker::Address.latitude,
        longitude: Faker::Address.longitude,
        price: Faker::Number.decimal(3,2),
        accomodation: Faker::Number.number(2),
        city: Faker::Address.city,
        state: Faker::Address.state_abbr)

      puts "Listing #{i}: listing for host #{listing.user.first_name} created!"
    end
  end

  Seed.start
end
