def echo(word)
  word
end

def shout(words)
  words.upcase
end

def repeat(word, repeat = 2)
  words = Array.new(repeat, word)
  words.join(" ")
end

def start_of_word(word, number)
  word[0...number]
end

def first_word(string)
  array = string.split
  array[0]
end

def titleize(string)
  little_words = ["and", "the", "over"]
  new_string = ""
  array = string.split
  new_words = array.map.with_index do |word, i|
    if i != 0 && little_words.include?(word)
      word.downcase
    else
      word[0].upcase + word[1..-1].downcase
    end
  end
  new_words.join(" ")
end


#  it "does capitalize 'little words' at the start of a title" do
#    expect(titleize("the bridge over the river kwai")).to eq("The Bridge over the River Kwai")
