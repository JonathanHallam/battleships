require 'ships'

describe Ships do

  it "checks if a ship is sunk" do
    a = Aircraft_carrier.new
    expect(a.check_sunk(a.show)).to eql(false)
  end

  it "checks if a ship is sunk 2" do
    a = Battleship.new
    a.hit(0)
    a.hit(1)
    a.hit(2)
    a.hit(3)
    expect(a.check_sunk(a.show)).to eql(true)
  end

  it "checks if a ship is sunk 3" do
    a = Patrol.new
    a.hit(1)
    expect(a.check_sunk(a.show)).to eql(false)
  end

end
