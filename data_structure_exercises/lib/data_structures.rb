# EASY

# Write a method that returns the range of its argument (an array of integers).
def range(arr)
  # your code goes here
  #sorted = arr.sort
  #(sorted[0]..sorted[-1]).to_a.length - 1
  arr.max - arr.min
end

# Write a method that returns a boolean indicating whether an array is in sorted
# order. Use the equality operator (==), which returns a boolean indicating
# whether its operands are equal, e.g., 2 == 2 => true, ["cat", "dog"] ==
# ["dog", "cat"] => false
def in_order?(arr)
  # your code goes here
  arr.sort == arr
end


# MEDIUM

# Write a method that returns the number of vowels in its argument
def num_vowels(str)
  # your code goes here   flatten => 2
  vowels = "aeiouAEIOU"
  return str.split("").count { |letter| vowels.include?(letter) }

end

# Write a method that returns its argument with all its vowels removed.
def devowel(str)
  # your code goes here   grapes => grps
  vowels = "aeiouAEIOU"
  str.split("").select { |letter| !vowels.include?(letter) }.join

end


# HARD

# Write a method that returns the returns an array of the digits of a
# non-negative integer in descending order and as strings, e.g.,
# descending_digits(4291) #=> ["9", "4", "2", "1"]
def descending_digits(int)
  # your code goes here
  #array = int.to_s.split("")
  #array.sort.reverse
  int.to_s.chars.sort.reverse
end

# Write a method that returns a boolean indicating whether a string has
# repeating letters. Capital letters count as repeats of lowercase ones, e.g.,
# repeating_letters?("Aa") => true
def repeating_letters?(str)
  # your code goes here
  str.downcase.chars.uniq.length != str.length
end

# Write a method that converts an array of ten integers into a phone number in
# the format "(123) 456-7890".
def to_phone_number(arr)
  # your code goes here
  string = arr.join.to_s
  number = "(" + string[0..2] + ") " + string[3..5] + "-" + string[6..9]
end

# Write a method that returns the range of a string of comma-separated integers,
# e.g., str_range("4,1,8") #=> 7
def str_range(str)
  # your code goes here
  sorted_array = str.split(",").sort
  sorted_numbers = sorted_array.each { |number| number.to_i }
  (sorted_numbers[0]..sorted_numbers[-1]).to_a.length - 1
end


#EXPERT

# Write a method that is functionally equivalent to the rotate(offset) method of
# arrays. offset=1 ensures that the value of offset is 1 if no argument is
# provided. HINT: use the take(num) and drop(num) methods. You won't need much
# code, but the solution is tricky!
def my_rotate(arr, offset=1)
  # your code goes here    [1,2,3,4,5], 2  ==> [3,4,5,1,2]
  arr.drop(offset % arr.length) + (arr.take(offset % arr.length))
end
