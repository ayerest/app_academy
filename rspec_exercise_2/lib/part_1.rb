def partition(arr, num)
    less_than = []
    greater_than = []

    arr.each do |element|
        if element < num
            less_than << element
        else
            greater_than << element
        end
    end

    [less_than, greater_than]

end

def merge(hash_1, hash_2)
    new_hash = {}
    hash_1.each { |key, value| new_hash[key] = value }
    hash_2.each { |key, value| new_hash[key] = value }
    new_hash
end

def censor(sentence, curse_words)
    words = sentence.split(" ")

    new_words = words.map do |word|
        if curse_words.include?(word.downcase)
            star_vowels(word)
        else
            word
        end
    end

    new_words.join(" ")
end


def star_vowels(word)
    vowels = "aeiou"
    new_string = ""

    word.each_char do |letter|
        if vowels.include?(letter.downcase)
            new_string += "*"
        else
            new_string += letter
        end
    end

    new_string
end

def power_of_two?(number)
    product = 1
    while product < number
        product *= 2
    end

    product == number
end