# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
  def span 
    return nil if self.empty?
    self.max - self.min
  end

  def average
    return nil if self.empty?
    self.sum / (self.length * 1.0) 
  end

  def median
    return nil if self.empty?

    if self.length.odd?
        mid_index = self.length / 2
        return self.sort[mid_index]
    else
        sorted = self.sort
        mid_index = self.length / 2
        first_element = sorted[mid_index]
        second_element = sorted[mid_index - 1]
        return (first_element + second_element) / 2.0
    end
  end

  def counts
    count_hash = Hash.new(0)
    
    self.each { |element| count_hash[element] += 1 }

    count_hash
  end


  def my_count(argy)
    count = 0
    self.each { |element| count += 1 if element == argy  }
    count
  end


  def my_index(argy)
    self.each_index { |index| return index if self[index] == argy }
    nil
  end

  def my_uniq
    hashy = {}
    self.each { |element| hashy[element] = true }
    hashy.keys
  end

  def my_transpose 
    new_array = []

    (0...self.length).each do |row|   # iterate through row
        new_row = []
        (0...self.length).each do |column| #iterate through column
            new_row << self[column][row]
        end
        new_array << new_row
    end

    new_array
  end
end
