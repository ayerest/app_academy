class Board

    attr_reader :size

    def self.print_grid(grid)
        grid.each do |row|
            puts row.join(" ")
        end
    end
    
    def initialize(n)
        @grid = Array.new(n) { Array.new(n, :N) }  #block syntax allows us to execute a new array for each block (the arrays aren't all pointing to the same place)
        @size = n * n
    end

    def [](position)
        row, col = position #because position is array of 2 elements
        @grid[row][col]
    end

    def []=(position, value)
        row, col = position
        @grid[row][col] = value
    end

    def num_ships
        @grid.flatten.count { |element| element == :S }
    end

    def attack(position)
        if self[position] == :S
            self[position] = :H
            puts 'you sunk my battleship!'
            return true
        else
            self[position] = :X
            return false
        end
    end

    def place_random_ships
        total_ships = @size * 0.5

        while self.num_ships < total_ships
            rand_row = rand(0...@grid.length)
            rand_col = rand(0...@grid.length)
            rand_pos = [rand_row, rand_col]
            self[rand_pos] = :S
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
        hidden_grid = self.hidden_ships_grid
        Board.print_grid(hidden_grid)
    end
  
end
