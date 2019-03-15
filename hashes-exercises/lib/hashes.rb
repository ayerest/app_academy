# EASY

# Define a method that, given a sentence, returns a hash of each of the words as
# keys with their lengths as values. Assume the argument lacks punctuation.

def word_lengths(str)
    # nested = []
    # str.split.each do |word|
    #     nested << [word, word.length]
    # end
    # nested.to_h

    lengths = {}
    str.split.each {|word| lengths[word] = word.length}
    lengths
end

# Define a method that, given a hash with integers as values, returns the key
# with the largest value.
def greatest_key_by_val(hash)
    sorted_thing = hash.sort_by { |k, v| v }
    sorted_thing[-1][0]
end

# Define a method that accepts two hashes as arguments: an older inventory and a
# newer one. The method should update keys in the older inventory with values
# from the newer one as well as add new key-value pairs to the older inventory.
# The method should return the older inventory as a result. march = {rubies: 10,
# emeralds: 14, diamonds: 2} april = {emeralds: 27, moonstones: 5}
# update_inventory(march, april) => {rubies: 10, emeralds: 27, diamonds: 2,
# moonstones: 5}
def update_inventory(older, newer)
    newer.each do |k, v|
        older[k] = v
    end
    older
end

# Define a method that, given a word, returns a hash with the letters in the
# word as keys and the frequencies of the letters as values.
def letter_counts(word)
    counter = Hash.new(0)
    word.split('').each do |letter|   #could also do each_char instead of split
        counter[letter] += 1
    end
    counter
end

# MEDIUM

# Define a method that, given an array, returns that array without duplicates.
# Use a hash! Don't use the uniq method.
def my_uniq(arr)
    count = Hash.new(0)
    arr.each do |item|
        count[item] += 1
    end
    count.keys
    # or could do these_keys = {}   arr.each {|item| these_keys[item] = true}   these_keys.keys
end

# Define a method that, given an array of numbers, returns a hash with "even"
# and "odd" as keys and the frequency of each parity as values.
def evens_and_odds(numbers)
    numbers_hash = { :even => 0, :odd => 0 }
    numbers.each do |number|
        numbers_hash[:even] += 1 if number.even?
        numbers_hash[:odd] += 1 if number.odd?
    end
    numbers_hash
end

# Define a method that, given a string, returns the most common vowel. Do
# not worry about ordering in the case of a tie. Assume all letters are 
# lower case.
def most_common_vowel(string)
    count = Hash.new(0)
    vowels = %w(a e i o u)
    string.each_char do |letter|
        count[letter] += 1 if vowels.include?(letter)
    end 

    count.sort_by { |k, v| v }.last.first
end

# HARD

# Define a method that, given a hash with keys as student names and values as
# their birthday months (numerically, e.g., 1 corresponds to January), returns
# every combination of students whose birthdays fall in the second half of the
# year (months 7-12). students_with_birthdays = { "Asher" => 6, "Bertie" => 11,
# "Dottie" => 8, "Warren" => 9 }
# fall_and_winter_birthdays(students_with_birthdays) => [ ["Bertie", "Dottie"],
# ["Bertie", "Warren"], ["Dottie", "Warren"] ]
def fall_and_winter_birthdays(students)

  selected = students.select do |student, month|
    month >= 7
  end

  names = selected.keys
  result = []

  names.each_index do |index1|
    ((index1 + 1)...names.length).each do |index2|
      result << [ names[index1], names[index2] ]
    end
  end

  result
end

# Define a method that, given an array of specimens, returns the biodiversity
# index as defined by the following formula: number_of_species**2 *
# smallest_population_size / largest_population_size biodiversity_index(["cat",
# "cat", "cat"]) => 1 biodiversity_index(["cat", "leopard-spotted ferret",
# "dog"]) => 9
def biodiversity_index(specimens)
    all_species = specimens.uniq
    count = {}

    all_species.each do |species|
        count[species] = specimens.count(species)
    end

    number_of_species = all_species.length
    smallest_population_size = count.values.min 
    largest_population_size = count.values.max

    number_of_species ** 2 * smallest_population_size / largest_population_size
    
end

# Define a method that, given the string of a respectable business sign, returns
# a boolean indicating whether pranksters can make a given vandalized string
# using the available letters. Ignore capitalization and punctuation.
# can_tweak_sign("We're having a yellow ferret sale for a good cause over at the
# pet shop!", "Leopard ferrets forever yo") => true
def can_tweak_sign?(normal_sign, vandalized_sign)
    no_prank = character_count(normal_sign)
    vandalized = character_count(vandalized_sign)

    vandalized.all? do |letter, count|
        no_prank[letter.downcase] >= count
    end
end

def character_count(str)
    count = Hash.new(0)

    str.each_char do |letter|
        next if letter == " "
        count[letter.downcase] += 1
    end

end
