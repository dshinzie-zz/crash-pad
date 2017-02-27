class Seed
  def self.start
    seed = Seed.new
    seed.create_users
    seed.create_admin
    seed.create_listings
  end

  def create_users
    1000.times do |i|
      user = User.create(
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
    user = User.create(
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
      Time.now - (60 * 60 * 24 * rand(1..20))
    else
      Time.now + (60 * 60 * 24 * rand(1..20))
    end
  end

  def create_listings
    User.all.limit(200).each_with_index do |user, index|
      listing = user.listings.create(
        description: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English",
        image_url: "apt#{rand(1..5)}.jpg",
        latitude: 39.7496354,
        longitude: -105.0001058 ,
        price: rand(50.00..500.00),
        accomodation: rand(1..10),
        city: "Denver",
        state: "CO",
        address: "#{10 + (index * 2)} Colorado Blvd",
        start_date: random_date("start"),
        end_date: random_date("end")
      )

      puts "Listing #{listing.city} created for #{user.first_name}"
    end

    User.all.limit(40).each_with_index do |user, index|
      listing = user.listings.create(
        description: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English",
        image_url: "apt#{rand(1..5)}.jpg",
        latitude: 39.7496354,
        longitude: -105.0001058 ,
        price: rand(50.00..500.00),
        accomodation: rand(1..10),
        city: "Evergreen",
        state: "CO",
        address: "#{32001 + (2 * index)} Stagecoach Boulevard",
        start_date: random_date("start"),
        end_date: random_date("end")
      )

      puts "Listing #{listing.city} created for #{user.first_name}"
    end

    User.all.limit(40).each_with_index do |user, index|
      listing = user.listings.create(
        description: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English",
        image_url: "apt#{rand(1..5)}.jpg",
        latitude: 39.7496354,
        longitude: -105.0001058 ,
        price: rand(50.00..500.00),
        accomodation: rand(1..10),
        city: "Evergreen",
        state: "CO",
        address: "#{32001 + (2 * index)} Stagecoach Boulevard",
        start_date: random_date("start"),
        end_date: random_date("end")
      )

      puts "Listing #{listing.city} created for #{user.first_name}"
    end

    User.all.limit(40).each_with_index do |user, index|
      listing = user.listings.create(
        description: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English",
        image_url: "apt#{rand(1..5)}.jpg",
        latitude: 39.7496354,
        longitude: -105.0001058 ,
        price: rand(50.00..500.00),
        accomodation: rand(1..10),
        city: "Denver",
        state: "CO",
        address: "#{2449 + (2 * index)} W Alameda Ave",
        start_date: random_date("start"),
        end_date: random_date("end")
      )

      puts "Listing #{listing.city} created for #{user.first_name}"
    end

    User.all.limit(40).each_with_index do |user, index|
      listing = user.listings.create(
        description: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English",
        image_url: "apt#{rand(1..5)}.jpg",
        latitude: 39.7496354,
        longitude: -105.0001058 ,
        price: rand(50.00..500.00),
        accomodation: rand(1..10),
        city: "Denver",
        state: "CO",
        address: "#{2449 + (2 * index)} Federal Ave",
        start_date: random_date("start"),
        end_date: random_date("end")
      )

      puts "Listing #{listing.city} created for #{user.first_name}"
    end
  end

  Seed.start
end
