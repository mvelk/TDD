require 'rspec'
require 'tdd'

describe "#my_uniq" do
  subject(:my_array) { [1,2,2,3,4] }
  it "returns unique elements from array" do
    expect(my_array.my_uniq).to eq(my_array.uniq)
  end
end

describe "#two_sum" do
  subject(:my_array) {[-1, 0, 2, -2, 1]}
  it "returns all pairs of positions where elements sum to 0" do
    expect(my_array.two_sum).to include([0,4], [2,3])
  end

  it "returns pairs in correct order" do
    expect(my_array.two_sum).to eq([[0,4],[2,3]])
  end
end

describe "#my_transpose" do
  subject(:my_array) { [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8]
    ] }
  it "returns the transposed matrix" do
    expect(my_array.my_transpose).to eq(my_array.transpose)
  end
end

describe TowersOfHanoi do

  before(:each) { @game = TowersOfHanoi.start_new_game(5) }

  describe "#initialize" do
    it "sets @towers equal to array of discs" do
      expect(@game.towers.class).to be(Array)
    end
  end

  describe "::start_new_game" do
    it "creates a game instance" do
      expect(@game.class).to be(TowersOfHanoi)
    end

    it "places discs on first tower" do
      expect(@game.towers[0]).to_not be_empty
    end
  end

  describe "#get_move" do
    subject(:new_game) {TowersOfHanoi.new([[3], [2], [1]])}

    it "raises an error when move is invalid" do
      expect{new_game.valid_move(0,1)}.to raise_error("Can't move bigger disc onto smaller disc")
    end
  end

  describe "#make_move" do
    subject(:new_game) {TowersOfHanoi.new([[3], [2], [1]])}

    it "removes last disc from from_pos" do
      new_game.make_move(2,1)
      expect(new_game.towers[2]).to be_empty
    end
    it "adds that disc to to_pos" do
      new_game.make_move(2,1)
      expect(new_game.towers[1]).to eq([2,1])
    end
  end

  describe "#won?" do
    before do
      @won_game = TowersOfHanoi.new([[3,2,1], [], []])
      @won_game.make_move(0,1)
      @won_game.make_move(0,2)
      @won_game.make_move(1,2)
      @won_game.make_move(0,1)
      @won_game.make_move(2,0)
      @won_game.make_move(2,1)
      @won_game.make_move(0,1)
    end
    it "returns true when all discs are in second tower" do
      expect(@won_game.won?).to be_truthy
    end
    it "returns false when win condition not met" do
      expect(@game.won?).to be_falsey
    end
  end

end
