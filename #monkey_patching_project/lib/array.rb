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
    sorted = self.sort
    return nil if self.empty?
    if self.length.odd?
        return sorted[self.length / 2]
    else
        return (sorted[(self.length / 2) - 1] + sorted[(self.length / 2)]) / 2.0
    end
  end

  def counts
    count_hash = Hash.new(0)
    self.each do |item|
        count_hash[item] += 1
    end
    count_hash
  end

  def my_count(value)
    counter = 0
    self.each {|item| counter += 1 if item == value }
    counter
  end

  def my_index(value)
    # if self.include?(value)
    #     self.each_with_index {|item, index| return index if item == value }
    # else
    #     return nil
    # end
    self.each_with_index {|item, index| return index if item == value }
    nil
  end

  def my_uniq
    # new_array = []
    # self.each do |element|
    #     new_array << element if !(new_array.include?(element))
    # end
    # new_array

    hash = {}
    self.each {|item| hash[item] = true}
    hash.keys
  end

  def my_transpose
    new_array = []
    (0...self.length).each do |row|
        new_row = []
        (0...self.length).each do |column|
            new_row << self[column][row]
        end
        new_array << new_row
    end
    new_array
  end
end
