# `add` takes two parameters and adds them
#
# `subtract` takes two parameters and subtracts the second from the first
#
# `sum` takes an *array* of parameters and adds them all together

# * `multiply` which multiplies two numbers together
# * `power` which raises one number to the power of another number
# * `[factorial](http://en.wikipedia.org/wiki/Factorial)` (check
#   Wikipedia if you forgot your high school math).


def add(num1, num2)
  num1 + num2
end

def subtract(num1, num2)
  num1 - num2
end

def sum(arr)
  total = 0
  arr.each_with_index do |number, index|
    total += arr[index]
  end
  return total
end

def multiply(*numbers)
  total = 1
  numbers.each { |number| total *= number }
  return total
end

def power(num1, num2)
  total = 1
  if num2 == 0
    return total
  end
  i = 1
  while i <= num2
    total *= num1
    i += 1
  end
  return total
end

def factorial(number)
  if number == 0
    return 0
  end
  total = 1
  (1..number).each { |num| total *= num }
  return total
end
