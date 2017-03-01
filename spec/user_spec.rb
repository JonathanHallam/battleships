require 'user'

describe User_input do

 before(:each) do
   @start = User_input.new
   @start.board_total.place_ac("4F", "horizontal")
   @start.board_total.place_battleship("1B", "vertical")
   @start.board_total.place_sub("6D", "horizontal")
   @start.board_total.place_destroyer("8I", "vertical")
   @start.board_total.place_patrol("9B", "horizontal")
 end

  it "checks aircraft carrier co-ordinates" do
    expect(@start.check_placement("1A", "vertical", 5)).to eq(true)
    expect(@start.check_placement("1G", "horizontal", 5)).to eq(false)
    expect(@start.check_placement("7D", "horizontal", 5)).to eq(true)
    expect(@start.check_placement("8c", "vertical", 5)).to eq(false)
    expect(@start.check_placement("3H", "vertical", 5)).to eq(true)
  end

  it "checks warship carrier co-ordinates" do
    expect(@start.check_placement("3H", "vertical", 4)).to eq(true)
    expect(@start.check_placement("3H", "horizontal", 4)).to eq(false)
    expect(@start.check_placement("10G", "horizontal", 4)).to eq(true)
  end

  it "checks for existing ships" do
    expect(@start.check_clashes("10G", "horizontal", 4)).to eq(false)
    expect(@start.check_clashes("7G", "vertical", 4)).to eq(true)
    expect(@start.check_placement("7G", "vertical", 5)).to eq(false)
    expect(@start.check_clashes("4E", "vertical", 2)).to eq(true)
    expect(@start.check_clashes("4E", "horizontal", 2)).to eq(false)
  end

  it "moves the y co-ordinate to the end of the string if it's not already 1" do
    expect(@start.swap_coords("G10")).to eq("10G")
    expect(@start.swap_coords("G8")).to eq("8G")
  end

  it "changes the case of input if it's wrong" do
    expect(@start.swap_coords("8g")).to eq("8G")
  end

  it "does both" do
    expect(@start.swap_coords("h4")).to eq("4H")
  end

  it "does everything we've built so far" do
    place = @start.swap_coords("h4")
    expect(@start.check_clashes(place, "vertical", 3)).to eq(false)
  end

end
