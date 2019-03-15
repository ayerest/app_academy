# EASY

# Return the argument with all its lowercase characters removed.
def destructive_uppercase(str)
  str.each_char do |letter|
    if letter == letter.downcase
      str.delete!(letter)
    end
  end
  return str
end

# Return the middle character of a string. Return the middle two characters if
# the word is of even length, e.g. middle_substring("middle") => "dd",
# middle_substring("mid") => "i"
def middle_substring(str)
  middle = str.length / 2
  if str.length.odd?
    return str[middle]
  end
  str[middle-1..middle]
end

# Return the number of vowels in a string.
# VOWELS = %w(a e i o u)
def num_vowels(str)
  vowels = "aeiou"
  count = 0
  str.each_char do |letter|
    if vowels.include?(letter.downcase)
      count += 1
    end
  end
  return count
end

# Return the factoral of the argument (num). A number's factorial is the product
# of all whole numbers between 1 and the number itself. Assume the argument will
# be > 0.
def factorial(num)
  factorial = 1
  (1..num).each { |number| sum *= number }
  return factorial
end


# MEDIUM

# Write your own version of the join method. separator = "" ensures that the
# default seperator is an empty string.
def my_join(arr, separator = "")
  str = ""
  arr.each_index do |i|
    str += arr[i]
    str += separtor unless i == arr.length - 1
  end
  return str
end

# Write a method that converts its argument to weirdcase, where every odd
# character is lowercase and every even is uppercase, e.g.
# weirdcase("weirdcase") => "wEiRdCaSe"
def weirdcase(str)
  new_str = ''
  array = str.chars
  array.each_index do |i|
    if i.odd?
      new_str += array[i].upcase
    else
      new_str += array[i].downcase
    end
  end
  return new_str
end

# Reverse all words of five more more letters in a string. Return the resulting
# string, e.g., reverse_five("Looks like my luck has reversed") => "skooL like
# my luck has desrever")
def reverse_five(str)

end

# Return an array of integers from 1 to n (inclusive), except for each multiple
# of 3 replace the integer with "fizz", for each multiple of 5 replace the
# integer with "buzz", and for each multiple of both 3 and 5, replace the
# integer with "fizzbuzz".
def fizzbuzz(n)

end


# HARD

# Write a method that returns a new array containing all the elements of the
# original array in reverse order.
def my_reverse(arr)
  reversed_array = []

  arr.each do |element|
   reversed_array.unshift(element)
  end

  return reversed_array
end

# Write a method that returns a boolean indicating whether the argument is
# prime.
def prime?(num)
  if num < 2
    return false
  end
  (2...num).each do |number|
    if num % number == 0
      return false
    end
  end
  return true
end

# Write a method that returns a sorted array of the factors of its argument.
def factors(num)
  new_array = []
  (1..num).each do |number|
    if number % num == 0
      new_array << num
    end
  end
  new_array
end

# Write a method that returns a sorted array of the prime factors of its argument.
def prime_factors(num)
  new_array = []
  factors(num).each do |factor|
    if prime?(factor)
      new_array << factor
    end
  end
  return new_array

end

# Write a method that returns the number of prime factors of its argument.
def num_prime_factors(num)
  prime_factors(num).length
end


# EXPERT

# Return the one integer in an array that is even or odd while the rest are of
# opposite parity, e.g. oddball([1,2,3]) => 2, oddball([2,4,5,6] => 5)
def oddball(arr)
  even_count = []
  odd_count = []
  arr.each_index do |number|
    if number.odd?
      odd_count << arr[i]
    else
      even_count << arr[i]
    end
  end

  if odd_count.length > 1
    return even_count[0]
  end

  return odd_count[0]

end
