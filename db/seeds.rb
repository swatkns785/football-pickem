require 'csv'

###seed method for weeks
(1..17).each do |week|
  Week.create(week_number: week)
  puts "Created week ##{week}."
end

###Seed method for games
csv = CSV.read('2015_regular_season_schedule.csv', headers: true)

csv.each do |row|
  Game.create(week_id: row['Week'],
              day: row['Day'],
              date: row['Date'],
              visitor_team: row['VisTm'],
              home_team: row['HomeTm'],
              time: row['Time'])
end
