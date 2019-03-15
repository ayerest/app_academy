def translate(sentence)
  translated_words = sentence.split(" ").map do |word|
    translate_word(word)
  end
  translated_words.join(" ")
end

def translate_word(word)
  vowels = %w(a e i o u)
  if vowels.include?(word[0])
    "#{word}ay"
  else
    index = 0
    until vowels.include?(word[index])
      index += 1
    end
    index += 1 if word[index - 1] == "q"
    "#{word[index..-1]}#{word[0...index]}ay"
  end
end


  # Test-driving bonus:
  # * write a test asserting that capitalized words are still capitalized (but with a different initial capital letter, of course)
  # * retain the punctuation from the original phrase
