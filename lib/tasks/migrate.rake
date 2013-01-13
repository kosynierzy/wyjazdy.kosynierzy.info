namespace :migrate do
  desc "Migrate seasons from matches column to separate table"
  task :seasons => :environment do
    Match.all.each do |m|
      puts "Update season_id for #{m.id} #{m.date} #{m.home_team}..."
      s = Season.find_by_name(m.season)
      puts "... with season #{s.id}..."
      m.update_attribute(:season_id, s.id)
      puts "done!"
    end
  end
end
