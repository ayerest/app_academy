require_relative "code"

class Mastermind

    def initialize(length)
        @secret_code = Code.random(length)
    end

    def print_matches(guess_code)
       puts "Exact matches:  #{@secret_code.num_exact_matches(guess_code)}"
       puts "Near matches: #{@secret_code.num_near_matches(guess_code)}"
    end

    def ask_user_for_guess
        puts "Enter a code"
        puts "Hint: code should contain only letters R,G,B, and Y"
        guess = Code.from_string(gets.chomp)
        self.print_matches(guess)
        @secret_code == guess
    end

end
