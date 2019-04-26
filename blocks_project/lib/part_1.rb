def select_even_nums(array)
    # array.select { |number| number.even? }
    array.select(&:even?)
end

def reject_puppies(array)
    array.reject do |pup|
        pup["age"] <= 2
    end
end

def count_positive_subarrays(array)
    array.count { |subarray| subarray.sum > 0}
end

def aba_translate(word)
    vowels = "aeiou"
    string = ''
    word.each_char do |letter|
        if vowels.include?(letter.downcase)
            string += letter + "b" + letter
        else
            string += letter
        end
    end
    string
end

def aba_array(words_array)
    words_array.map { |word| aba_translate(word) }
end