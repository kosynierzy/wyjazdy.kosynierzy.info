step "there are following trips:" do |table|
  seasons = {}
  matches = []
  table.hashes.map { |h| h["Season"] }.uniq.each { |s| seasons[s] = Season.create!(name: s) }
  table.hashes.map do |h|
    m = Match.new do |match|
      match.season = seasons[h["Season"]]
      match.date = h["Date"]
      match.home_team = h["Home"]
      match.away_team = h["Away"]
      match.home_score = h["Score"].match(/(\d+):/)[1]
      match.away_score = h["Score"].match(/:(\d+)/)[1]
      match.game_type = h["Type"]
      match.save!
    end
    m.create_trip!({ official_number: h["Number"] })
    matches << m
  end

  @matches = matches.sort_by { |m| m.date }.reverse
end

step "I am guest user" do
end

step "I visit on tour page" do
  switch_to_subdomain('wyjazdy')
  visit "/"
end

step "I should see tour history list" do
  page.all(:xpath, "//table[@id='trips']//tbody//tr").each_with_index do |row, index|
    row.find(:xpath, "td[1]").text.should eq(@matches[index].season.name)
    row.find(:xpath, "td[3]").text.should eq(@matches[index].home_team)
    row.find(:xpath, "td[4]").text.should eq("#{@matches[index].home_score}:#{@matches[index].away_score}")
    row.find(:xpath, "td[5]").text.should eq(@matches[index].trip.official_number.to_s)
  end
end

step "I should not see a column about being on tour" do
  # todo
end

step "I should see a column about being on tour" do
  # todo
end
