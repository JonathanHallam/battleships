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

  def player_one_hit(coord)

    a = coord.chop.to_i + 1
    b = @opponent_x_coord[coord[-1]]
    c = @player_one.board_total.x_coord_hash[coord[-1]]

    if @player_two.board_total.check_for_ship(coord) == true
      @player_one.board_total.board[a][b] = "@"
      @player_two.board_total.board[a][c] = "@"
    else
      @player_one.board_total.board[a][b] = "o"
      @player_two.board_total.board[a][c] = "o"
    end

  end

  def player_two_hit(coord)

    a = coord.chop.to_i + 1
    b = @opponent_x_coord[coord[-1]]
    c = @player_two.board_total.x_coord_hash[coord[-1]]

    if @player_one.board_total.check_for_ship(coord) == true
      @player_two.board_total.board[a][b] = "@"
      @player_one.board_total.board[a][c] = "@"
    else
      @player_two.board_total.board[a][b] = "o"
      @player_one.board_total.board[a][c] = "o"
    end

  end

end

def new_game
  Field.new
end
