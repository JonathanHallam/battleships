require './lib/board.rb'

puts "\tYou there"
puts "\tWhat is your name?"
print "\t>>"
name1 = $stdin.gets.chomp.capitalize
puts "\tGreetings Admiral #{name1}"
puts "\tWhat is your opponents name?"
print "\t>>"
name2 = $stdin.gets.chomp.capitalize

player_one = new_board
player_two = new_board

puts
puts
puts "\tAdmiral #{name1}, where do you put your aircraft carrier?"
puts
puts
player_one.show_board
puts
puts
print "\t>>"
aircraft_carrier_place = $stdin.gets.chomp.upcase
puts "\t1 - Vertically"
puts "\t2 - Horizonatally"
puts "\t>>"
aircraft_carrier_orientation = $stdin.gets.chomp.downcase
if aircraft_carrier_orientation.start_with?("v", "1")
  aircraft_carrier_orientation = "vertical"
else
  aircraft_carrier_orientation = "horizontal"
end
puts
player_one.place_ac(aircraft_carrier_place, aircraft_carrier_orientation)
puts
puts "\tAnd your battleship?"
player_one.show_board
print "\t>>"
battleship_place = $stdin.gets.chomp.upcase
puts "\t1 - Vertically"
puts "\t2 - Horizonatally"
puts "\t>>"
battleship_orientation = $stdin.gets.chomp.downcase
if battleship_orientation.start_with?("v", "1")
  battleship_orientation = "vertical"
else
  battleship_orientation = "horizontal"
end
player_one.place_battleship(battleship_place, battleship_orientation)
player_one.show_board
