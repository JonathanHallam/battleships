require 'ships'
require 'board'

class User_input


  attr_accessor :mock_board, :x_hash
  def initialize
    @mock_board = [
      ["---YOUR BATTLEFIELD---","---","-OPPONENT BATTLEFIELD-"],
      ["  ", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J","---","  ", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J",],
      [" 1", "~", "X", "~", "~", "~", "~", "~", "~", "~", "~","---", " 1", "~", "~", "~", "~", "~", "~", "~", "~", "~", "~"],
      [" 2", "~", "X", "~", "~", "~", "~", "~", "~", "~", "~","---", " 2", "~", "~", "~", "~", "~", "~", "~", "~", "~", "~"],
      [" 3", "~", "X", "~", "~", "~", "~", "~", "~", "~", "~","---", " 3", "~", "~", "~", "~", "~", "~", "~", "~", "~", "~"],
      [" 4", "~", "X", "~", "~", "~", "X", "X", "X", "X", "X","---", " 4", "~", "~", "~", "~", "~", "~", "~", "~", "~", "~"],
      [" 5", "~", "X", "~", "~", "~", "~", "~", "~", "~", "~","---", " 5", "~", "~", "~", "~", "~", "~", "~", "~", "~", "~"],
      [" 6", "~", "~", "~", "X", "X", "X", "~", "~", "~", "~","---", " 6", "~", "~", "~", "~", "~", "~", "~", "~", "~", "~"],
      [" 7", "~", "~", "~", "~", "~", "~", "~", "~", "~", "~","---", " 7", "~", "~", "~", "~", "~", "~", "~", "~", "~", "~"],
      [" 8", "~", "~", "~", "~", "~", "~", "~", "~", "X", "~","---", " 8", "~", "~", "~", "~", "~", "~", "~", "~", "~", "~"],
      [" 9", "~", "~", "~", "~", "~", "~", "~", "~", "X", "~","---", " 9", "~", "~", "~", "~", "~", "~", "~", "~", "~", "~"],
      ["10", "~", "~", "~", "~", "~", "~", "~", "~", "X", "~","---", "10", "~", "~", "~", "~", "~", "~", "~", "~", "~", "~"]
        ]

    @x_hash = { "A" => 1, "B" => 2, "C" => 3, "D" => 4, "E" => 5,
                "F" => 6, "G" => 7, "H" => 8, "I" => 9, "J" => 10 }

  end

  def check_placement(place, direction, ship_length)
    if direction == "horizontally"
      return false if @x_hash[place[-1]] >= 12 - ship_length ; true
    elsif direction == "vertically"
      return false if place.chomp.to_i >= 12 - ship_length ; true
    end
  end

  def check_clashes(place, direction, ship_length)
    x_coord = @x_hash[place[-1]]
    y_coord = place.chop.to_i + 1
    if check_placement(place, direction, ship_length) == false
      false
    elsif direction == "horizontally"
      going_here = @mock_board[y_coord][x_coord...x_coord + ship_length]
      return false if going_here.include?("X") ; true
    elsif direction == "vertically"
      running_total = [*0...ship_length]
      a = running_total.map { |x| @mock_board[y_coord + x][x_coord] }
      return false if a.include?("X") ; true
    end
  end

end
