class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  attr_reader :pegs

  def self.valid_pegs?(chars)
    chars.all? { |char| POSSIBLE_PEGS.has_key?(char.upcase) }
  end

  def self.random(length)
    random_pegs = []
    length.times do 
      random_pegs << POSSIBLE_PEGS.keys.sample
    end
    Code.new(random_pegs)
  end

  def self.from_string(pegs)
    Code.new(pegs.split(""))

  end



  def initialize(pegs)
    if Code.valid_pegs?(pegs)
      @pegs = pegs.map(&:upcase)
    else
      raise "Does not contain valid pegs"
    end
  end

  def [](index)
    @pegs[index]
  end

  def length
    @pegs.length
  end

  def num_exact_matches(guess)
    match_number = 0
    # guess.pegs.each_with_index do |guess_peg, guess_index|
    #   match_number += 1 if guess_peg == @pegs[guess_index]
    # end
    (0...guess.length).each do |index|
      match_number += 1 if guess[index] == self[index] #@pegs[index]
    end
    match_number
  end

  def num_near_matches(guess)
    near_match_number = 0
    (0...guess.length).each do |index|
      if @pegs.include?(guess[index]) && @pegs[index] != guess[index]
        near_match_number += 1
      end
    end
    near_match_number
  end

  def ==(other_code)
    self.pegs == other_code.pegs
  end

end
