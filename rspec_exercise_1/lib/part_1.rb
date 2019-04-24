def average(num_1, num_2)
    (num_1 + num_2) / 2.0
end

def average_array(arr1)
    # sum = 0
    # arr1.each do |number|
    #     sum += number
    # end
    # sum / (arr1.length * 1.0)
    arr1.sum / (arr1.length * 1.0)
end

def repeat(str, num)
    new_str = ''
    num.times { new_str += str }
    new_str
    # or can do str * num
end

def yell(str)
    str.upcase + "!"
end

def alternating_case(sentence)
    words = sentence.split(" ")
    new_words = words.map.with_index do |word, index|
        if index % 2 == 0
            word.upcase
        else
            word.downcase
        end
    end
    new_words.join(" ")
end