def palindrome?(string)
    string.each_char.with_index do |letter, index|
        if !(letter == string[string.length - (index + 1)])
            return false
        end
    end
    true
end

def substrings(string)
    subs = []
    (0...string.length).each do |start_index|
        (start_index...string.length).each do |end_index|
            subs << string[start_index..end_index]
        end
    end

    subs
end

def palindrome_substrings(string)
    substrings(string).select { |substring| palindrome?(substring) && substring.length > 1 }
end