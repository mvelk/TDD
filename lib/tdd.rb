class Array
  def my_uniq
    uniques = []
    self.each do |el|
      uniques << el unless uniques.include?(el)
    end
    uniques
  end

  def two_sum
    two_sums = []
    self.each_with_index do |el1, idx1|
      self.each_with_index do |el2, idx2|
        two_sums << [idx1, idx2] if idx1 != idx2 && el1 + el2 == 0 &&
          !two_sums.include?([idx2, idx1])
      end
    end
    two_sums
  end

  def my_transpose
    transposed_matrix = Array.new(self[0].length) { Array.new(self.length) }
    self.each_with_index do |el, row|
      el.each_with_index do |sub_el, col|
        transposed_matrix[col][row] = sub_el
      end
    end
    transposed_matrix
  end
end

class TowersOfHanoi

  attr_reader :towers

  def self.start_new_game(n = 3)
    towers = Array.new(3){ [] }
    idx = 1
    while idx <= n
      towers[0] << idx
      idx += 1
    end
    TowersOfHanoi.new(towers)
  end

  def initialize(towers)
    @towers = towers
    @original_height = towers[0].length
    play_game
  end

  def play_game
    until won?
      self.render
      from_pos, to_pos = get_move
      make_move(from_pos, to_pos)
    end
    puts "You won!"
  end

  def won?
    @towers[1].length == @original_height || @towers[2].length == @original_height
  end

  def get_move
    puts "Where you wanna move from?"
    from_pos = gets.chomp.to_i
    puts "Where you wanna move to?"
    to_pos = gets.chomp.to_i
    valid_move(from_pos, to_pos)
    [from_pos, to_pos]
  rescue StandardError => e
    puts e
    retry
  end

  def make_move(from_pos, to_pos)
    @towers[to_pos].push(@towers[from_pos].pop)
  end

  def valid_move(from_pos, to_pos)
    from_disc = @towers[from_pos].last
    raise "No disc found at selected tower" unless from_disc
    return if @towers[to_pos].empty?
    to_disc = @towers[to_pos].last
    raise "Can't move bigger disc onto smaller disc" unless from_disc < to_disc
  end

  def render
    p @towers
  end

end

if __FILE__ == $0
  game = TowersOfHanoi.start_new_game(3)
end
