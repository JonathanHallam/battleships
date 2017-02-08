
class Playing_field



  attr_accessor :board, :x_coord_hash
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

      # => So here I'd much prefer to link it to the ships, so have an instance of each ship
      # => for each player and import in their values, more class oriented

      @board[place.chop.to_i + 1][@x_coord_hash[coord]..(@x_coord_hash[coord] + 4)] = ["X", "X", "X", "X", "X"]
      @board[place.chop.to_i + 1].flatten
    else
      @board[place.chop.to_i + 1][@x_coord_hash[coord]] = "X"
      @board[place.chop.to_i + 2][@x_coord_hash[coord]] = "X"
      @board[place.chop.to_i + 3][@x_coord_hash[coord]] = "X"
      @board[place.chop.to_i + 4][@x_coord_hash[coord]] = "X"
      @board[place.chop.to_i + 5][@x_coord_hash[coord]] = "X"

    end
  end

  def place_battleship(place, direction)
    coord = place[-1]
    if direction == "horizontal"
      coord = place[-1]
      @board[place.chop.to_i + 1][@x_coord_hash[coord]..(@x_coord_hash[coord] + 3)] = ["X", "X", "X", "X"]
      @board[place.chop.to_i + 1].flatten
    else
      @board[place.chop.to_i + 1][@x_coord_hash[coord]] = "X"
      @board[place.chop.to_i + 2][@x_coord_hash[coord]] = "X"
      @board[place.chop.to_i + 3][@x_coord_hash[coord]] = "X"
      @board[place.chop.to_i + 4][@x_coord_hash[coord]] = "X"
    end
  end

  def place_sub(place, direction)
    coord = place[-1]
    if direction == "horizontal"
      coord = place[-1]
      @board[place.chop.to_i + 1][@x_coord_hash[coord]..(@x_coord_hash[coord] + 2)] = ["X", "X", "X"]
      @board[place.chop.to_i + 1].flatten
    else
      @board[place.chop.to_i + 1][@x_coord_hash[coord]] = "X"
      @board[place.chop.to_i + 2][@x_coord_hash[coord]] = "X"
      @board[place.chop.to_i + 3][@x_coord_hash[coord]] = "X"
    end
  end

  def place_destroyer(place, direction)
    coord = place[-1]
    if direction == "horizontal"
      coord = place[-1]
      @board[place.chop.to_i + 1][@x_coord_hash[coord]..(@x_coord_hash[coord] + 2)] = ["X", "X", "X"]
      @board[place.chop.to_i + 1].flatten
    else
      @board[place.chop.to_i + 1][@x_coord_hash[coord]] = "X"
      @board[place.chop.to_i + 2][@x_coord_hash[coord]] = "X"
      @board[place.chop.to_i + 3][@x_coord_hash[coord]] = "X"
    end
  end

  def place_patrol(place, direction)
    coord = place[-1]
    if direction == "horizontal"
      coord = place[-1]
      @board[place.chop.to_i + 1][@x_coord_hash[coord]..(@x_coord_hash[coord] + 1)] = ["X", "X"]
      @board[place.chop.to_i + 1].flatten
    else
      @board[place.chop.to_i + 1][@x_coord_hash[coord]] = "X"
      @board[place.chop.to_i + 2][@x_coord_hash[coord]] = "X"
    end
  end

end

def new_board
  Playing_field.new
end
