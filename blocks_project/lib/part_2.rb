def all_words_capitalized?(words_array)
    # words_array.all? { |word| word[0].upcase == word[0] && word[1..-1].downcase == word[1..-1] } 

     words_array.all? { |word| word.capitalize == word } 
end


def no_valid_url?(urls_array)
    endings = [".org", ".com", ".net", ".io"]
    urls_array.none? do |url|
        endings.any? { |ending| url.end_with?(ending)}
    end
end

def any_passing_students?(students_array)
    students_array.any? do |student|
        grades = student[:grades]
        avg = grades.sum / (grades.length * 1.0)
        avg >= 75
    end
end

