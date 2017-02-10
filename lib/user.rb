require 'ships'
require 'board'

class User_input


  attr_accessor :board_total # :mock_board, :x_hash
  def initialize

    @board_total = Playing_field.new


# => This is what the board in the test case "should" look like
#      ["---YOUR BATTLEFIELD---","---","-OPPONENT BATTLEFIELD-"],
#      ["  ", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J","---","  ", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J",],
#      [" 1", "~", "X", "~", "~", "~", "~", "~", "~", "~", "~","---", " 1", "~", "~", "~", "~", "~", "~", "~", "~", "~", "~"],
#      [" 2", "~", "X", "~", "~", "~", "~", "~", "~", "~", "~","---", " 2", "~", "~", "~", "~", "~", "~", "~", "~", "~", "~"],
#      [" 3", "~", "X", "~", "~", "~", "~", "~", "~", "~", "~","---", " 3", "~", "~", "~", "~", "~", "~", "~", "~", "~", "~"],
#      [" 4", "~", "X", "~", "~", "~", "X", "X", "X", "X", "X","---", " 4", "~", "~", "~", "~", "~", "~", "~", "~", "~", "~"],
#      [" 5", "~", "~", "~", "~", "~", "~", "~", "~", "~", "~","---", " 5", "~", "~", "~", "~", "~", "~", "~", "~", "~", "~"],
#      [" 6", "~", "~", "~", "X", "X", "X", "~", "~", "~", "~","---", " 6", "~", "~", "~", "~", "~", "~", "~", "~", "~", "~"],
#      [" 7", "~", "~", "~", "~", "~", "~", "~", "~", "~", "~","---", " 7", "~", "~", "~", "~", "~", "~", "~", "~", "~", "~"],
#      [" 8", "~", "~", "~", "~", "~", "~", "~", "~", "X", "~","---", " 8", "~", "~", "~", "~", "~", "~", "~", "~", "~", "~"],
#      [" 9", "~", "X", "X", "~", "~", "~", "~", "~", "X", "~","---", " 9", "~", "~", "~", "~", "~", "~", "~", "~", "~", "~"],
#      ["10", "~", "~", "~", "~", "~", "~", "~", "~", "X", "~","---", "10", "~", "~", "~", "~", "~", "~", "~", "~", "~", "~"]
#        ]

  end

  def use_field
    @board_total
  end

  def check_placement(place, direction, ship_length)

    if direction == "horizontally"
      return false if @board_total.x_hash[place[-1]] >= 12 - ship_length ; true
    elsif direction == "vertically"
      return false if place.chomp.to_i >= 12 - ship_length ; true
    end
  end

  def check_clashes(place, direction, ship_length)
    x_coord = @board_total.x_hash[place[-1]]
    y_coord = place.chop.to_i + 1
    if check_placement(place, direction, ship_length) == false
      false
    elsif direction == "horizontally"
      going_here = @board_total.use_board[y_coord][x_coord...x_coord + ship_length]
      return false if going_here.include?("X") ; true
    elsif direction == "vertically"
      running_total = [*0...ship_length]
      a = running_total.map { |x| @board_total.use_board[y_coord + x][x_coord] }
      return false if a.include?("X") ; true
    end
  end

  def swap_coords(coord)
    coord.upcase!
    if coord.start_with?("A", "B", "C", "D", "E", "F", "G", "H", "I", "J")
      return coord[1..-1] + coord[0]
    else
      coord
    end
  end

  def hit(coord)
    # => So for p1 this needs to hit a place on the p2
    # => board and on a different co-ordinate on the
    # => p1 board, also needs to change the state of
    # => the ship that's been hit. So maybe the placement
    # => of each ship needs to be recorded somehow.
    # => Also need to define what 'sunk' is, and it's possible
    # => that my placement should have each cell linked
    # => to the ship array.

  end

end
