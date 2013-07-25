step "there are following trips:" do |table|
  seasons = {}
  users = {}
  matches = []
  table.hashes.map { |h| h["Season"] }.uniq.each { |s| seasons[s] = Season.create!(name: s) }
  table.hashes.map { |h| h["Visitor"] }.keep_if(&:present?).uniq.each { |u| users[u] = create(:user, username: u) }

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
    t = m.create_trip!({ official_number: h["Number"] })
    matches << m
    if h["Visitor"].present?
      users[h["Visitor"]].trips << t
    end
  end

  @matches = matches.sort_by { |m| m.date }.reverse
  @user1 = users['user1']
end

step "I am guest user" do
end

step "I am signed in as user1" do
  switch_to_subdomain('account')
  visit '/users/sign_in'
  fill_in 'Username', with: 'user1'
  fill_in 'Password', with: 'password'
  click_button "Sign in"
  expect(page).to have_content("Zalogowano pomyślnie")
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
  expect(page).to_not have_selector(:xpath, "//table[@id='trips']//thead//tr//th[8]")
end

step "I should see a column about being on tour" do
  expect(page).to have_selector(:xpath, "//table[@id='trips']//thead//tr//th[8]")
end

step "I should see that I have been twice on tour" do
  expect(page.find(:xpath, "//table[@id='trips']//thead//tr//th[8]")).to have_content("Obecność(2)")
end

step "I should have registered presence" do
  page.all(:xpath, "//table[@id='trips']//tbody//tr").each_with_index do |row, index|
    presence = @user1.trips.include?(@matches[index].trip)
    row.find(:xpath, "td[8]").text.should eq(presence ? ':)' : ':(')
  end
end
