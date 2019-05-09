def reverser(string, &prc)
    new_str = string.reverse
    prc.call(new_str)
end

def word_changer(sentence, &prc)
    word_array = []
    sentence.split(" ").each do |word|
       word_array << prc.call(word)
    end
    word_array.join(" ")
end

def greater_proc_value(number, prc1, prc2)
    if prc1.call(number) > prc2.call(number)
        prc1.call(number)
    else
        prc2.call(number)
    end
end

def and_selector(array, prc1, prc2)
    new_array = []
    array.each do |item|
        if prc1.call(item) && prc2.call(item)
            new_array << item
        end
    end
    new_array
end

def alternating_mapper(array, prc1, prc2)
    new_array = []
    array.each_with_index do |item, index|
        if index % 2 == 0
            new_array << prc1.call(item)
        else
            new_array << prc2.call(item)
        end
    end
    new_array
end