# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.

def largest_prime_factor(number)
    # large = 0
    # (1..number).each do |factor|
    #     if is_prime?(factor) && number % factor == 0
    #         large = factor
    #     end
    # end
    # large
    number.downto(2) do |factor| 
        if number % factor == 0 && is_prime?(factor)
            return factor
        end
    end
end

def is_prime?(number)
    return false if number < 2
    # (2...number).each do |factor|
    #     if number % factor == 0
    #         return false
    #     end
    # end
    # true

    (2...number).none? { |i| number % i == 0 }
end


def unique_chars?(string)
    # string_array = string.split("")
    # string_array.uniq.length == string_array.length

    already_seen = []

    string.each_char do |letter|
        if already_seen.include?(letter)
            return false
        end
        already_seen << letter
    end
    true
end

def dupe_indices(array)
    my_hash = Hash.new { |hash, key| hash[key] = [] }

    array.each.with_index do |element_1, index_1|
        my_hash[element_1] << index_1
    end

    my_hash.select { |key, value| value.length > 1 }
end

def ele_count(arr)
    count_hash = Hash.new(0)
    arr.each { |element| count_hash[element] += 1 }
    count_hash
end


def ana_array(array_1, array_2)
    count_1 = ele_count(array_1)
    count_2 = ele_count(array_2)
    count_1 == count_2

end