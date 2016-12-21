class Seed
  def self.start
    seed = Seed.new
    seed.create_users
    seed.create_admin
    seed.create_listings
  end

  def create_users
    50.times do |i|
      user = User.create!(
        email: "user#{i}@user.com",
        first_name: "Jonny_#{i}",
        last_name: "Quest",
        phone: rand(10**10),
        password_digest: "password",
        api_key: nil,
        avatar_url: "stock.jpg",
        role: 0)

      puts "User #{i}: #{user.email} created!"
    end
  end

  def create_admin
    user = User.create!(
      email: "clancey007@example.com",
      first_name: "Admin",
      last_name: "Quest",
      phone: rand(10**10),
      password_digest: "password",
      api_key: nil,
      avatar_url: "stock.jpg",
      role: 1)

    puts "Admin #{user.email} created!"
  end

  def random_date(type)
    if type == "start"
      Time.now - (60 * 60 * 24 * rand(1..60))
    else
      Time.now + (60 * 60 * 24 * rand(1..60))
    end
  end

  def create_listings
    User.all.each do |user|
      20.times do |i|
        listing = user.listings.create!(
          description: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English",
          image_url: "apt#{rand(1..5)}.jpg",
          latitude: 39.7496354 + i,
          longitude: -105.0001058 - i,
          price: rand(50.00..500.00),
          accomodation: rand(1..10),
          city: "Denver",
          state: "CO",
          address: "1510 Blake St",
          start_date: random_date("start"),
          end_date: random_date("end")
        )

        puts "Listing #{listing.city} created for #{user.first_name}"

        listing = user.listings.create!(
          description: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English",
          image_url: "apt#{rand(1..5)}.jpg",
          latitude: 29.7579212 + i,
          longitude: -95.36348079999999 - i,
          price: rand(50.00..500.00),
          accomodation: rand(1..10),
          city: "Houston",
          state: "TX",
          address: "811 Main St",
          start_date: random_date("start"),
          end_date: random_date("end")
        )

        puts "Listing #{listing.city} created for #{user.first_name}"

        listing = user.listings.create!(
          description: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English",
          image_url: "apt#{rand(1..5)}.jpg",
          latitude: 30.29571079999999 + i,
          longitude: -97.74421289999999 - i,
          price: rand(50.00..500.00),
          accomodation: rand(1..10),
          city: "Austin",
          state: "TX",
          address: "2828 Rio Grande st",
          start_date: random_date("start"),
          end_date: random_date("end")
        )

        puts "Listing #{listing.city} created for #{user.first_name}"

        listing = user.listings.create!(
          description: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English",
          image_url: "apt#{rand(1..5)}.jpg",
          latitude: 39.7508398 + i,
          longitude: -104.9965293 - i,
          price: rand(50.00..500.00),
          accomodation: rand(1..10),
          city: "Denver",
          state: "CO",
          address: "1331 17th St",
          start_date: random_date("start"),
          end_date: random_date("end")
        )

        puts "Listing #{listing.city} created for #{user.first_name}"

        listing = user.listings.create!(
          description: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English",
          image_url: "apt#{rand(1..5)}.jpg",
          latitude: 39.7439476 + i,
          longitude: -105.0202786 - i,
          price: rand(50.00..500.00),
          accomodation: rand(1..10),
          city: "Denver",
          state: "CO",
          address: "1701 Bryant St",
          start_date: random_date("start"),
          end_date: random_date("end")
        )

        puts "Listing #{listing.city} created for #{user.first_name}"
      end
    end
  end

  Seed.start
end
