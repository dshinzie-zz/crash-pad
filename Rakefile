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
end
