require './field.rb'

puts "\n\tYou there\n"
puts "\n\tWhat is your name?\n"
print "\n\t>>"
@name1 = $stdin.gets.chomp.capitalize
puts "\n\tGreetings Admiral #{@name1}\n"
puts "\n\tWhat is your opponents name?\n"
print "\n\t>>"
@name2 = $stdin.gets.chomp.capitalize

@game = new_game
puts "\n\n\tAdmiral #{@name1}"


def put_down_aircraft_carrier
  puts "\n\tWhere would you like to place your aircraft carrier?"
  print "\t>>"
  ac_place = $stdin.gets.chomp
  puts "\tAnd in what direction?"
  puts "\t1 - horizontal\n\t2 - vertical"
  print "\t>>"
  ac_orientation = $stdin.gets.chomp
  a = [ac_place, ac_orientation]
  a[0] = @game.player_one.swap_coords(a[0])
  a[1] = @game.player_one.change_orientation(a[1])
  if @game.player_one.check_clashes(a[0], a[1], 5) == true
    @game.player_one.board_total.place_ac(a[0], a[1])
  else
    puts "\tSorry Admiral, that ship can't go there!"
    put_down_aircraft_carrier
  end
end

def put_down_battleship
  puts "\n\tWhere would you like to place your battleship?"
  print "\t>>"
  battleship_place = $stdin.gets.chomp
  puts "\tAnd in what direction?"
  puts "\t1 - horizontal\n\t2 - vertical"
  print "\t>>"
  battleship_orientation = $stdin.gets.chomp
  b = [battleship_place, battleship_orientation]
  b[0] = @game.player_one.swap_coords(b[0])
  b[1] = @game.player_one.change_orientation(b[1])
  if @game.player_one.check_clashes(b[0], b[1], 4) == true
    @game.player_one.board_total.place_battleship(b[0], b[1])
  else
    puts "\tSorry Admiral, that ship can't go there!"
    put_down_battleship
  end
end

def put_down_destroyer
  puts "\n\tAnd your destroyer?"
  print "\t>>"
  destroyer_place = $stdin.gets.chomp
  puts "\tAnd in what direction?"
  puts "\t1 - horizontal\n\t2 - vertical"
  print "\t>>"
  destroyer_orientation = $stdin.gets.chomp
  d = [destroyer_place, destroyer_orientation]
  d[0] = @game.player_one.swap_coords(d[0])
  d[1] = @game.player_one.change_orientation(d[1])
  if @game.player_one.check_clashes(d[0], d[1], 3) == true
    @game.player_one.board_total.place_destroyer(d[0], d[1])
  else
    puts "\tSorry Admiral, that ship can't go there!"
    put_down_destroyer
  end
end

def put_down_sub
  puts "\n\tAnd your sub?"
  print "\t>>"
  sub_place = $stdin.gets.chomp
  puts "\tAnd in what direction?"
  puts "\t1 - horizontal\n\t2 - vertical"
  print "\t>>"
  sub_orientation = $stdin.gets.chomp
  s = [sub_place, sub_orientation]
  s[0] = @game.player_one.swap_coords(s[0])
  s[1] = @game.player_one.change_orientation(s[1])
  if @game.player_one.check_clashes(s[0], s[1], 3) == true
    @game.player_one.board_total.place_sub(s[0], s[1])
  else
    puts "\tSorry Admiral, that ship can't go there!"
    put_down_sub
  end
end

def put_down_patrol
  puts "\n\tAnd your patrol boat?"
  print "\t>>"
  patrol_place = $stdin.gets.chomp
  puts "\tAnd in what direction?"
  puts "\t1 - horizontal\n\t2 - vertical"
  print "\t>>"
  patrol_orientation = $stdin.gets.chomp
  pa = [patrol_place, patrol_orientation]
  pa[0] = @game.player_one.swap_coords(pa[0])
  pa[1] = @game.player_one.change_orientation(pa[1])
  if @game.player_one.check_clashes(pa[0], pa[1], 2) == true
    @game.player_one.board_total.place_patrol(pa[0], pa[1])
  else
    puts "\tSorry Admiral, that ship can't go there!"
    put_down_patrol
  end
end


def put_down_aircraft_carrier_2
  puts "\n\tWhere would you like to place your aircraft carrier?"
  print "\t>>"
  ac_place = $stdin.gets.chomp
  puts "\tAnd in what direction?"
  puts "\t1 - horizontal\n\t2 - vertical"
  print "\t>>"
  ac_orientation = $stdin.gets.chomp
  a = [ac_place, ac_orientation]
  a[0] = @game.player_two.swap_coords(a[0])
  a[1] = @game.player_two.change_orientation(a[1])
  if @game.player_two.check_clashes(a[0], a[1], 5) == true
    @game.player_two.board_total.place_ac(a[0], a[1])
  else
    puts "\tSorry Admiral, that ship can't go there!"
    put_down_aircraft_carrier_2
  end
end

def put_down_battleship_2
  puts "\n\tWhere would you like to place your battleship?"
  print "\t>>"
  battleship_place = $stdin.gets.chomp
  puts "\tAnd in what direction?"
  puts "\t1 - horizontal\n\t2 - vertical"
  print "\t>>"
  battleship_orientation = $stdin.gets.chomp
  b = [battleship_place, battleship_orientation]
  b[0] = @game.player_two.swap_coords(b[0])
  b[1] = @game.player_two.change_orientation(b[1])
  if @game.player_two.check_clashes(b[0], b[1], 4) == true
    @game.player_two.board_total.place_battleship(b[0], b[1])
  else
    puts "\tSorry Admiral, that ship can't go there!"
    put_down_battleship_2
  end
end

def put_down_destroyer_2
  puts "\n\tAnd your destroyer?"
  print "\t>>"
  destroyer_place = $stdin.gets.chomp
  puts "\tAnd in what direction?"
  puts "\t1 - horizontal\n\t2 - vertical"
  print "\t>>"
  destroyer_orientation = $stdin.gets.chomp
  d = [destroyer_place, destroyer_orientation]
  d[0] = @game.player_two.swap_coords(d[0])
  d[1] = @game.player_two.change_orientation(d[1])
  if @game.player_two.check_clashes(d[0], d[1], 3) == true
    @game.player_two.board_total.place_destroyer(d[0], d[1])
  else
    puts "\tSorry Admiral, that ship can't go there!"
    put_down_destroyer_2
  end
end

def put_down_sub_2
  puts "\n\tAnd your sub?"
  print "\t>>"
  sub_place = $stdin.gets.chomp
  puts "\tAnd in what direction?"
  puts "\t1 - horizontal\n\t2 - vertical"
  print "\t>>"
  sub_orientation = $stdin.gets.chomp
  s = [sub_place, sub_orientation]
  s[0] = @game.player_two.swap_coords(s[0])
  s[1] = @game.player_two.change_orientation(s[1])
  if @game.player_two.check_clashes(s[0], s[1], 3) == true
    @game.player_two.board_total.place_sub(s[0], s[1])
  else
    puts "\tSorry Admiral, that ship can't go there!"
    put_down_sub_2
  end
end

def put_down_patrol_2
  puts "\n\tAnd your patrol boat?"
  print "\t>>"
  patrol_place = $stdin.gets.chomp
  puts "\tAnd in what direction?"
  puts "\t1 - horizontal\n\t2 - vertical"
  print "\t>>"
  patrol_orientation = $stdin.gets.chomp
  pa = [patrol_place, patrol_orientation]
  pa[0] = @game.player_two.swap_coords(pa[0])
  pa[1] = @game.player_two.change_orientation(pa[1])
  if @game.player_two.check_clashes(pa[0], pa[1], 2) == true
    @game.player_two.board_total.place_patrol(pa[0], pa[1])
  else
    puts "\tSorry Admiral, that ship can't go there!"
    put_down_patrol_2
  end
end

def hit_cycle
  puts "\n\n\nAdmiral #{@name1}, where do we aim?"
  @game.player_one.board_total.show_board
  hit_1 = $stdin.gets.chomp
  hit_2 = @game.player_one.swap_coords(hit_1)
  @game.player_one_hit(hit_2)

  @game.player_one.board_total.show_board
  sleep(2)
  puts "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"
  puts "\tPlease pass over to Admiral #{@name2}."
  sleep(2)
  exit(0) if @game.player_one.board_total.show_board.flatten.include?("X") == false
  puts "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"
  puts "\tAdmiral #{@name2}, where do we aim?"
  @game.player_two.board_total.show_board
  hit_3 = $stdin.gets.chomp
  hit_4 = @game.player_one.swap_coords(hit_3)
  @game.player_two_hit(hit_4)

  @game.player_one.board_total.refresh_all
  @game.player_two.board_total.refresh_all

  puts @game.player_one.board_total.carrier.ship.join(" ")
  puts @game.player_one.board_total.battleship.ship.join(" ")
  puts @game.player_one.board_total.submarine.ship.join(" ")
  puts @game.player_one.board_total.destroyer.ship.join(" ")
  puts @game.player_one.board_total.patrol.ship.join(" ")
  puts @game.player_two.board_total.carrier.ship.join(" ")
  puts @game.player_two.board_total.battleship.ship.join(" ")
  puts @game.player_two.board_total.submarine.ship.join(" ")
  puts @game.player_two.board_total.destroyer.ship.join(" ")
  puts @game.player_two.board_total.patrol.ship.join(" ")

  @game.player_two.board_total.show_board
  sleep(2)
  puts "\n\n\n\n\n\n\n\n\n\n\n"
  puts "\tPlease pass over to Admiral #{@name1}."
  sleep(2)
  puts "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"
end


@game.player_one.board_total.show_board
put_down_aircraft_carrier
@game.player_one.board_total.show_board
put_down_battleship
@game.player_one.board_total.show_board
put_down_destroyer
@game.player_one.board_total.show_board
put_down_sub
@game.player_one.board_total.show_board
put_down_patrol
puts "\tAdmiral #{@name1}, this is your board\n"
@game.player_one.board_total.show_board
puts "\n\n\n\n\n\n\n\n\n\n\n\n\n\n"
puts "\tPlease pass over to Admiral #{@name2}."
sleep(5)
puts "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"
puts "\tAdmiral #{@name2}\n\n"
@game.player_two.board_total.show_board
put_down_aircraft_carrier_2
@game.player_two.board_total.show_board
put_down_battleship_2
@game.player_two.board_total.show_board
put_down_destroyer_2
@game.player_two.board_total.show_board
put_down_sub_2
@game.player_two.board_total.show_board
put_down_patrol_2
@game.player_two.board_total.show_board

puts "Please pass over to Admiral #{@name1}"
sleep(5)
puts "\n\n\n\n\n\n\n\n\n\n\n\n\n\n"

until @game.player_one.board_total.show_board.flatten.include?("X") == false || @game.player_two.board_total.show_board.flatten.include?("X") == false
  hit_cycle
end
puts "\n\n\n\n\n\n\n\n\n\n\n\n\n\n"
if @game.player_two.board_total.show_board.flatten.include?("X") == false
  puts "Congratulations Admiral #{@name1}, our enemies lie t the bottom of the sea"
else
  puts "Congratulations Admiral #{@name2}, our enemies lie t the bottom of the sea"
end
