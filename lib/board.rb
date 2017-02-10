require 'ships'


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

  def place_ac(place, direction)
    coord = place[-1]
    if direction == "horizontal"
      coord = place[-1]
      @board[place.chop.to_i + 1][@x_coord_hash[coord]..(@x_coord_hash[coord] + 4)] = @carrier.show
      @board[place.chop.to_i + 1].flatten
    else
      @board[place.chop.to_i + 1][@x_coord_hash[coord]] = @carrier.show[0]
      @board[place.chop.to_i + 2][@x_coord_hash[coord]] = @carrier.show[1]
      @board[place.chop.to_i + 3][@x_coord_hash[coord]] = @carrier.show[2]
      @board[place.chop.to_i + 4][@x_coord_hash[coord]] = @carrier.show[3]
      @board[place.chop.to_i + 5][@x_coord_hash[coord]] = @carrier.show[4]
    end
  end

  def place_battleship(place, direction)
    coord = place[-1]
    if direction == "horizontal"
      coord = place[-1]
      @board[place.chop.to_i + 1][@x_coord_hash[coord]..(@x_coord_hash[coord] + 3)] = @battleship.show
      @board[place.chop.to_i + 1].flatten
    else
      @board[place.chop.to_i + 1][@x_coord_hash[coord]] = @battleship.show[0]
      @board[place.chop.to_i + 2][@x_coord_hash[coord]] = @battleship.show[1]
      @board[place.chop.to_i + 3][@x_coord_hash[coord]] = @battleship.show[2]
      @board[place.chop.to_i + 4][@x_coord_hash[coord]] = @battleship.show[3]
    end
  end

  def place_sub(place, direction)
    coord = place[-1]
    if direction == "horizontal"
      coord = place[-1]
      @board[place.chop.to_i + 1][@x_coord_hash[coord]..(@x_coord_hash[coord] + 2)] = @submarine.show
      @board[place.chop.to_i + 1].flatten
    else
      @board[place.chop.to_i + 1][@x_coord_hash[coord]] = @submarine.show[0]
      @board[place.chop.to_i + 2][@x_coord_hash[coord]] = @submarine.show[1]
      @board[place.chop.to_i + 3][@x_coord_hash[coord]] = @submarine.show[2]
    end
  end

  def place_destroyer(place, direction)
    coord = place[-1]
    if direction == "horizontal"
      coord = place[-1]
      @board[place.chop.to_i + 1][@x_coord_hash[coord]..(@x_coord_hash[coord] + 2)] = @destroyer.show
      @board[place.chop.to_i + 1].flatten
    else
      @board[place.chop.to_i + 1][@x_coord_hash[coord]] = @destroyer.show[0]
      @board[place.chop.to_i + 2][@x_coord_hash[coord]] = @destroyer.show[1]
      @board[place.chop.to_i + 3][@x_coord_hash[coord]] = @destroyer.show[2]
    end
  end

  def place_patrol(place, direction)
    coord = place[-1]
    if direction == "horizontal"
      @board[place.chop.to_i + 1][@x_coord_hash[coord]..(@x_coord_hash[coord] + 1)] = @patrol.show
      @board[place.chop.to_i + 1].flatten
    else
      @board[place.chop.to_i + 1][@x_coord_hash[coord]] = @patrol.show[0]
      @board[place.chop.to_i + 2][@x_coord_hash[coord]] = @patrol.show[1]
    end
  end

end

def new_board
  Playing_field.new
end
