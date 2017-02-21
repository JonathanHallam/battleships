# => So this needs to be accessable for all of the other
# => classes and alterable from them too... not sure how to
# => make this happen

# => I don't know if there's any advantage to having a ships
# => class and sub classes for each ship...

class Ships

  def check_sunk(ship)
    ship.delete("@")
    ship == []
  end

  def sunk_message
    puts "Your #{@name} has been sunk."
  end

  def hit(coord)
    @ship[coord] = "@"
  end

end

class Aircraft_carrier < Ships

  attr_accessor :ship, :name
  def initialize
    @ship = []
    @name = "aircraft carrier"
  end

end

class Battleship < Ships

  attr_accessor :ship, :name
  def initialize
    @ship = []
    @name = "battleship"
  end

end

class Submarine < Ships

  attr_accessor :ship, :name
  def initialize
    @ship = []
    @name = "submarine"
  end

end

class Destroyer < Ships

  attr_accessor :ship, :name
  def initialize
    @ship = []
    @name = "destroyer"
  end

end

class Patrol < Ships

  attr_accessor :ship, :name
  def initialize
    @ship = []
    @name = "patrol boat"
  end

end
