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
  unless User.where(username: 'user1').any?
    create(:user, username: 'user1')
  end
  @account_page = AccountPage.new
  @account_page.load
  @account_page.sign_in.username.set 'user1'
  @account_page.sign_in.password.set 'password'
  @account_page.sign_in.submit.click
  expect(page).to have_content("Zalogowano pomyślnie")
end

step "I visit on tour page" do
  @trips_page = OnTour::TripsPage.new
  @trips_page.load
end

step "I should see tour history list" do
  @trips_page.trips.rows.each_with_index do |row, index|
    expect(row.season_cell.text).to eq(@matches[index].season.name)
    expect(row.rival_cell.text).to eq(@matches[index].home_team)
    expect(row.score_cell.text).to eq("#{@matches[index].home_score}:#{@matches[index].away_score}")
    expect(row.number_cell.text).to eq(@matches[index].trip.official_number.to_s)
  end
end

step "I should not see a column about being on tour" do
  expect(@trips_page.trips.header).to_not have_presence_cell
end

step "I should see a column about being on tour" do
  expect(@trips_page.trips.header).to have_presence_cell
end

step "I should see that I have been twice on tour" do
  expect(@trips_page.trips.header.presence_cell).to have_content("Obecność(2)")
end

step "I should have registered presence" do
  @trips_page.trips.rows.each_with_index do |row, index|
    presence = @user1.trips.include?(@matches[index].trip)
    expect(row.presence_cell).to have_content(presence ? ':)' : ':(')
  end
end

step "I say that I have been at game" do
  find('a', text: ':(').click
end

step "I should see a smile" do
  find('a', text: ':)')
end

step "I say that I have not been at game" do
  find('a', text: ':)').click
end

step "I should see a sad smile" do
  find('a', text: ':(')
end

step "I should increase number of trips" do
  expect(@trips_page.trips.header.presence_cell).to have_content("Obecność(1)")
end

step "I should decrease number of trips" do
  expect(@trips_page.trips.header.presence_cell).to have_content("Obecność(0)")
end
