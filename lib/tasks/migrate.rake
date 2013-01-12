namespace :migrate do
  desc "Migrate seasons from matches column to separate table"
  task :seasons => :environment do
    Match.pluck(:season).uniq.each do |season|
      puts "Migrating season #{season}..."
      Season.create!(:name => season)
      puts "done!"
    end
  end
end
