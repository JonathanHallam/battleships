require './user.rb'

class Field


  attr_accessor :player_one, :player_two, :opponent_x_coord
  def initialize

    @player_one = User_input.new
    @player_two = User_input.new

    @opponent_x_coord = {   "A" => 13, "B" => 14, "C" => 15, "D" => 16, "E" => 17,
                            "F" => 18, "G" => 19, "H" => 20, "I" => 21, "J" => 22

    }
  end

  def p1
    @player_one
  end

  def p2
    @player_two
  end


  # => So all of the definitions up till now have been pretty simple, now I need to work
  # => on the hitting element, all of the actual gameplay will be held separately.
  # => Start point is going to be creating something that checks the status of a
  # => cell on the board.

  def player_one_hit(coord)

    a = coord.chop.to_i + 1
    b = @opponent_x_coord[coord[-1]]
    c = @player_one.user_class.x_hash[coord[-1]]

    if @player_two.user_class.check_for_ship(coord) == true
      @player_one.user_class.use_board[a][b] = "@"
      @player_two.user_class.use_board[a][c] = "@"
    else
      @player_one.user_class.use_board[a][b] = "o"
      @player_two.user_class.use_board[a][c] = "o"
    end

  end

  def player_two_hit(coord)

    a = coord.chop.to_i + 1
    b = @opponent_x_coord[coord[-1]]
    c = @player_two.user_class.x_hash[coord[-1]]

    if @player_one.user_class.check_for_ship(coord) == true
      @player_two.user_class.use_board[a][b] = "@"
      @player_one.user_class.use_board[a][c] = "@"
    else
      @player_two.user_class.use_board[a][b] = "o"
      @player_one.user_class.use_board[a][c] = "o"
    end

  end



end

def new_game
  Field.new
end
