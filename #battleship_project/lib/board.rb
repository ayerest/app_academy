class Board

  def self.print_grid(grid)
    grid.each do |row|
        puts row.join(" ")
    end
  end

  attr_reader :size

  def initialize(n)
    @grid = Array.new(n) { Array.new(n, :N) }
    @size = n * n
  end

  def [](position)
    row = position[0]
    col = position[1]
    @grid[row][col]
  end

  def []=(position, value)
    row, col = position
    @grid[row][col] = value
  end

  def num_ships
    # count = 0
    # @grid.each do |array|
    #     if array.include?(:S)
    #         count += 1
    #     end
    # end
    # count

        @grid.flatten.count { |item| item == :S }
  end

  def attack(position)
    if self[position] == :S
        self[position] = :H 
        puts "you sunk my battleship!"
        return true
    else
        self[position] = :X 
        return false
    end
  end

  def place_random_ships
    total_ships = @size * 0.25
    while self.num_ships < total_ships
        rand_row = rand(0...@grid.length)
        rand_col = rand(0...@grid.length)
        position = [rand_row, rand_col]
        self[position] = :S
    end
  end

  def hidden_ships_grid
    @grid.map do |row|
        row.map do |element|
            if element == :S 
                :N
            else
                element
            end
        end
    end
  end

  def cheat
    Board.print_grid(@grid)
  end

  def print
    Board.print_grid(self.hidden_ships_grid)
  end
end
