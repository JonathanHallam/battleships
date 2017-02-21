require './board.rb'

class User_input


  attr_accessor :board_total
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

  def check_placement(place, direction, ship_length)

    if direction == "horizontal"
      return false if @board_total.x_coord_hash[place[-1]] >= 12 - ship_length ; true
    elsif direction == "vertical"
      return false if place.chop.to_i >= 12 - ship_length ; true
    end
  end

  def check_clashes(place, direction, ship_length)
    x_coord = @board_total.x_coord_hash[place[-1]]
    y_coord = place.chop.to_i + 1
    if check_placement(place, direction, ship_length) == false
      false
    elsif direction == "horizontal"
      going_here = @board_total.board[y_coord][x_coord...x_coord + ship_length]
      return false if going_here.include?("X") ; true
    elsif direction == "vertical"
      running_total = [*0...ship_length]
      a = running_total.map { |x| @board_total.board[y_coord + x][x_coord] }
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

  def change_orientation(ord)
    ord.downcase!
    if ord.start_with?("h", "1")
      return "horizontal"
    else
      "vertical"
    end
  end

end
