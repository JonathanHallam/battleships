require './ships.rb'

class Playing_field

  attr_accessor :board, :x_coord_hash, :carrier, :battleship, :submarine, :destroyer, :patrol
  def initialize
    @board = [
                ["---YOUR BATTLEFIELD---","---","-OPPONENT BATTLEFIELD-"],
                ["  ", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J","---","  ", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J",],
                [" 1", "~", "~", "~", "~", "~", "~", "~", "~", "~", "~","---", " 1", "~", "~", "~", "~", "~", "~", "~", "~", "~", "~"],
                [" 2", "~", "~", "~", "~", "~", "~", "~", "~", "~", "~","---", " 2", "~", "~", "~", "~", "~", "~", "~", "~", "~", "~"],
                [" 3", "~", "~", "~", "~", "~", "~", "~", "~", "~", "~","---", " 3", "~", "~", "~", "~", "~", "~", "~", "~", "~", "~"],
                [" 4", "~", "~", "~", "~", "~", "~", "~", "~", "~", "~","---", " 4", "~", "~", "~", "~", "~", "~", "~", "~", "~", "~"],
                [" 5", "~", "~", "~", "~", "~", "~", "~", "~", "~", "~","---", " 5", "~", "~", "~", "~", "~", "~", "~", "~", "~", "~"],
                [" 6", "~", "~", "~", "~", "~", "~", "~", "~", "~", "~","---", " 6", "~", "~", "~", "~", "~", "~", "~", "~", "~", "~"],
                [" 7", "~", "~", "~", "~", "~", "~", "~", "~", "~", "~","---", " 7", "~", "~", "~", "~", "~", "~", "~", "~", "~", "~"],
                [" 8", "~", "~", "~", "~", "~", "~", "~", "~", "~", "~","---", " 8", "~", "~", "~", "~", "~", "~", "~", "~", "~", "~"],
                [" 9", "~", "~", "~", "~", "~", "~", "~", "~", "~", "~","---", " 9", "~", "~", "~", "~", "~", "~", "~", "~", "~", "~"],
                ["10", "~", "~", "~", "~", "~", "~", "~", "~", "~", "~","---", "10", "~", "~", "~", "~", "~", "~", "~", "~", "~", "~"]
                  ]

    @x_coord_hash = { "A" => 1, "B" => 2, "C" => 3, "D" => 4, "E" => 5,
                      "F" => 6, "G" => 7, "H" => 8, "I" => 9, "J" => 10
                      }

    @carrier = Aircraft_carrier.new
    @battleship = Battleship.new
    @submarine = Submarine.new
    @destroyer = Destroyer.new
    @patrol = Patrol.new

  end

  def show_board
    puts
    puts
    @board.each do |r|
      puts r.each { |p| p }.join(" ")
    end
  end


    coord = place[-1]
    @acplace = place
    @acdirection = direction
    if direction == "horizontal"
      coord = place[-1]
      @board[place.chop.to_i + 1][@x_coord_hash[coord]..(@x_coord_hash[coord] + 4)] = ["X", "X", "X", "X", "X"]
      @board[place.chop.to_i + 1].flatten
      @carrier.ship = [(@board[place.chop.to_i + 1][@x_coord_hash[coord]]), (@board[place.chop.to_i + 1][@x_coord_hash[coord] + 1]), (@board[place.chop.to_i + 1][@x_coord_hash[coord] + 2]), (@board[place.chop.to_i + 1][@x_coord_hash[coord] + 3]), (@board[place.chop.to_i + 1][@x_coord_hash[coord] + 4])]
    else
      @board[place.chop.to_i + 1][@x_coord_hash[coord]] = "X"
      @board[place.chop.to_i + 2][@x_coord_hash[coord]] = "X"
      @board[place.chop.to_i + 3][@x_coord_hash[coord]] = "X"
      @board[place.chop.to_i + 4][@x_coord_hash[coord]] = "X"
      @board[place.chop.to_i + 5][@x_coord_hash[coord]] = "X"
      @carrier.ship = [@board[place.chop.to_i + 1][@x_coord_hash[coord]], @board[place.chop.to_i + 2][@x_coord_hash[coord]], @board[place.chop.to_i + 3][@x_coord_hash[coord]], @board[place.chop.to_i + 4][@x_coord_hash[coord]], @board[place.chop.to_i + 5][@x_coord_hash[coord]]]
    end
  end

  def refresh_ac
    coord = @acplace[-1]
    if @acdirection == "horizontal"
      @carrier.ship = [ @board[@acplace.chop.to_i + 1][@x_coord_hash[coord]],
                        @board[@acplace.chop.to_i + 1][@x_coord_hash[coord] + 1],
                        @board[@acplace.chop.to_i + 1][@x_coord_hash[coord] + 2],
                        @board[@acplace.chop.to_i + 1][@x_coord_hash[coord] + 3],
                        @board[@acplace.chop.to_i + 1][@x_coord_hash[coord] + 4]  ]
    else
      @carrier.ship = [ @board[@acplace.chop.to_i + 1][@x_coord_hash[coord]],
                        @board[@acplace.chop.to_i + 2][@x_coord_hash[coord]],
                        @board[@acplace.chop.to_i + 3][@x_coord_hash[coord]],
                        @board[@acplace.chop.to_i + 4][@x_coord_hash[coord]],
                        @board[@acplace.chop.to_i + 5][@x_coord_hash[coord]] ]
    end
  end

  def place_battleship(place, direction)
    coord = place[-1]
    @bsplace = place
    @bsdirection = direction
    if direction == "horizontal"
      coord = place[-1]
      @board[place.chop.to_i + 1][@x_coord_hash[coord]..(@x_coord_hash[coord] + 3)] = ["X", "X", "X", "X"]
      @board[place.chop.to_i + 1].flatten
      @battleship.ship = [(@board[place.chop.to_i + 1][@x_coord_hash[coord]]), (@board[place.chop.to_i + 1][@x_coord_hash[coord] + 1]), (@board[place.chop.to_i + 1][@x_coord_hash[coord] + 2]), (@board[place.chop.to_i + 1][@x_coord_hash[coord] + 3])]
    else
      @board[place.chop.to_i + 1][@x_coord_hash[coord]] = "X"
      @board[place.chop.to_i + 2][@x_coord_hash[coord]] = "X"
      @board[place.chop.to_i + 3][@x_coord_hash[coord]] = "X"
      @board[place.chop.to_i + 4][@x_coord_hash[coord]] = "X"
      @battleship.ship = [@board[place.chop.to_i + 1][@x_coord_hash[coord]], @board[place.chop.to_i + 2][@x_coord_hash[coord]], @board[place.chop.to_i + 3][@x_coord_hash[coord]], @board[place.chop.to_i + 4][@x_coord_hash[coord]]]
    end
  end

  def refresh_bs
    coord = @bsplace[-1]
    if @bsdirection == "horizontal"
      @battleship.ship = [  @board[@bsplace.chop.to_i + 1][@x_coord_hash[coord]],
                            @board[@bsplace.chop.to_i + 1][@x_coord_hash[coord] + 1],
                            @board[@bsplace.chop.to_i + 1][@x_coord_hash[coord] + 2],
                            @board[@bsplace.chop.to_i + 1][@x_coord_hash[coord] + 3] ]
    else
      @battleship.ship = [  @board[@bsplace.chop.to_i + 1][@x_coord_hash[coord]],
                            @board[@bsplace.chop.to_i + 2][@x_coord_hash[coord]],
                            @board[@bsplace.chop.to_i + 3][@x_coord_hash[coord]],
                            @board[@bsplace.chop.to_i + 4][@x_coord_hash[coord]]]
    end
  end

  def place_sub(place, direction)
    coord = place[-1]
    @subplace = place
    @subdirection = direction
    if direction == "horizontal"
      coord = place[-1]
      @board[place.chop.to_i + 1][@x_coord_hash[coord]..(@x_coord_hash[coord] + 2)] = ["X", "X", "X"]
      @board[place.chop.to_i + 1].flatten
      @submarine.ship = [(@board[place.chop.to_i + 1][@x_coord_hash[coord]]), (@board[place.chop.to_i + 1][@x_coord_hash[coord] + 1]), (@board[place.chop.to_i + 1][@x_coord_hash[coord] + 2])]
    else
      @board[place.chop.to_i + 1][@x_coord_hash[coord]] = "X"
      @board[place.chop.to_i + 2][@x_coord_hash[coord]] = "X"
      @board[place.chop.to_i + 3][@x_coord_hash[coord]] = "X"
      @submarine.ship = [@board[place.chop.to_i + 1][@x_coord_hash[coord]], @board[place.chop.to_i + 2][@x_coord_hash[coord]], @board[place.chop.to_i + 3][@x_coord_hash[coord]]]
    end
  end

  def refresh_sub
    coord = @subplace[-1]
    if @subplace == "horizontal"
      @submarine.ship = [ @board[@subplace.chop.to_i + 1][@x_coord_hash[coord]],
                          @board[@subplace.chop.to_i + 1][@x_coord_hash[coord] + 1],
                          @board[@subplace.chop.to_i + 1][@x_coord_hash[coord] + 2]]
    else
      @submarine.ship = [ @board[@subplace.chop.to_i + 1][@x_coord_hash[coord]],
                          @board[@subplace.chop.to_i + 2][@x_coord_hash[coord]],
                          @board[@subplace.chop.to_i + 3][@x_coord_hash[coord]]]
    end
  end

  def place_destroyer(place, direction)
    coord = place[-1]
    @desplace = place
    @desdirection = direction
    if direction == "horizontal"
      coord = place[-1]
      @board[place.chop.to_i + 1][@x_coord_hash[coord]..(@x_coord_hash[coord] + 2)] = ["X", "X", "X"]
      @board[place.chop.to_i + 1].flatten
      @destroyer.ship = [(@board[place.chop.to_i + 1][@x_coord_hash[coord]]), (@board[place.chop.to_i + 1][@x_coord_hash[coord] + 1]), (@board[place.chop.to_i + 1][@x_coord_hash[coord] + 2])]
    else
      @board[place.chop.to_i + 1][@x_coord_hash[coord]] = "X"
      @board[place.chop.to_i + 2][@x_coord_hash[coord]] = "X"
      @board[place.chop.to_i + 3][@x_coord_hash[coord]] = "X"
      @destroyer.ship = [@board[place.chop.to_i + 1][@x_coord_hash[coord]], @board[place.chop.to_i + 2][@x_coord_hash[coord]], @board[place.chop.to_i + 3][@x_coord_hash[coord]]]
    end
  end

  def refresh_des
    coord = @desplace[-1]
    if @desdirection == "horizontal"
      @destroyer.ship = [ @board[@desplace.chop.to_i + 1][@x_coord_hash[coord]],
                          @board[@desplace.chop.to_i + 1][@x_coord_hash[coord] + 1],
                          @board[@desplace.chop.to_i + 1][@x_coord_hash[coord] + 2]]
    else
      @destroyer.ship = [ @board[@desplace.chop.to_i + 1][@x_coord_hash[coord]],
                          @board[@desplace.chop.to_i + 2][@x_coord_hash[coord]],
                          @board[@desplace.chop.to_i + 3][@x_coord_hash[coord]]]
    end
  end

  def place_patrol(place, direction)
    coord = place[-1]
    @patplace = place
    @patdirection = direction
    if direction == "horizontal"
      @board[place.chop.to_i + 1][@x_coord_hash[coord]..(@x_coord_hash[coord] + 1)] = ["X", "X"]
      @board[place.chop.to_i + 1].flatten
      @patrol.ship = [(@board[place.chop.to_i + 1][@x_coord_hash[coord]]), (@board[place.chop.to_i + 1][@x_coord_hash[coord] + 1])]
    else
      @board[place.chop.to_i + 1][@x_coord_hash[coord]] = "X"
      @board[place.chop.to_i + 2][@x_coord_hash[coord]] = "X"
      @patrol.ship = [@board[place.chop.to_i + 1][@x_coord_hash[coord]], @board[place.chop.to_i + 2][@x_coord_hash[coord]]]
    end
  end

  def refresh_pat
    coord = @patplace[-1]
    if @patdirection == "horizontal"
      @patrol.ship = [  @board[@patplace.chop.to_i + 1][@x_coord_hash[coord]],
                        @board[@patplace.chop.to_i + 1][@x_coord_hash[coord] + 1]]
    else
      @patrol.ship = [  @board[@patplace.chop.to_i + 1][@x_coord_hash[coord]],
                        @board[@patplace.chop.to_i + 2][@x_coord_hash[coord]]]
    end
  end

  def refresh_all
    refresh_ac
    refresh_bs
    refresh_sub
    refresh_des
    refresh_pat
  end

  def check_for_ship(coord)
    @board[coord.chop.to_i + 1][@x_coord_hash[coord[-1]]] == "X"
  end

end

def new_board
  Playing_field.new
end
