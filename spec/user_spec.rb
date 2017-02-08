require 'user'

describe User_input do

  it "checks aircraft carrier co-ordinates 1" do
    a = User_input.new
    expect(a.check_placement("1A", "vertically", 5)).to eq(true)
  end

  it "checks aircraft carrier co-ordinates 2" do
    a = User_input.new
    expect(a.check_placement("1G", "horizontally", 5)).to eq(false)
  end

  it "checks aircraft carrier co-ordinates 3" do
    a = User_input.new
    expect(a.check_placement("7D", "horizontally", 5)).to eq(true)
  end

  it "checks aircraft carrier co-ordinates 4" do
    a = User_input.new
    expect(a.check_placement("8c", "vertically", 5)).to eq(false)
  end

  it "checks aircraft carrier co-ordinates 5" do
    a = User_input.new
    expect(a.check_placement("3H", "vertically", 5)).to eq(true)
  end

  it "checks warship carrier co-ordinates 1" do
    a = User_input.new
    expect(a.check_placement("3H", "vertically", 4)).to eq(true)
  end

  it "checks warship carrier co-ordinates 2" do
    a = User_input.new
    expect(a.check_placement("3H", "horizontally", 4)).to eq(false)
  end

  it "checks warship carrier co-ordinates 3" do
    a = User_input.new
    expect(a.check_placement("10G", "horizontally", 4)).to eq(true)
  end

  it "checks for existing ships 1" do
    a = User_input.new
    expect(a.check_clashes("10G", "horizontally", 4)).to eq(false)
  end

  it "checks for existing ships 2" do
    a = User_input.new
    expect(a.check_clashes("7G", "vertically", 4)).to eq(true)
  end

  it "checks for existing ships 3" do
    a = User_input.new
    expect(a.check_clashes("7G", "vertically", 5)).to eq(false)
  end

  it "checks for existing ships 4" do
    a = User_input.new
    expect(a.check_clashes("4E", "vertically", 4)).to eq(false)
  end

  it "checks for existing ships 5" do
    a = User_input.new
    expect(a.check_clashes("4E", "horizontally", 2)).to eq(false)
  end

end