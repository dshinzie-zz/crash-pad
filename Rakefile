# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.
require_relative 'app/data/fix_seeds.rb'
require_relative 'config/application'

Rails.application.load_tasks

task :default => [:fix_seed_data]

namespace :fix_seed_data do
  task :fix_seed => :environment do
    fix_seed_locations
  end

  task :create_admin => :environment do
    User.find_by(email: "clancey007@example.com").delete
    User.create(email: "clancey007@example.com",
                first_name: "Admin",
                last_name: "Quest",
                phone: rand(10**10),
                password_digest: BCrypt::Password.create("password"),
                api_key: nil,
                avatar_url: "stock.jpg",
                role: 1,
                verified: true)
  end

  task :update_user => :environment do
    User.update_all(password_digest: BCrypt::Password.create("password"), verified: true)
  end
end
