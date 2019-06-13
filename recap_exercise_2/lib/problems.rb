# Write a method, least_common_multiple, that takes in two numbers and returns the smallest number that is a mutiple 
# of both of the given numbers
def least_common_multiple(num_1, num_2)
    # array = [num_1, num_2]
    # bigger_num = array.max
    # (1..bigger_num).each do |multiplier_one|
    #     multiple1 = num_1 * multiplier_one
    #     (1..bigger_num).each do |multiplier_two|
    #         multiple2 = num_2 * multiplier_two
    #         return multiple1 if multiple1 == multiple2
    #     end
    # end
    (1..num_1 * num_2).each do |multiple|
        return multiple if multiple % num_1 == 0 && multiple % num_2 == 0
    end
end


# Write a method, most_frequent_bigram, that takes in a string and returns the two adjacent letters that appear the
# most in the string.
def most_frequent_bigram(str)
    counts = Hash.new(0)
    (0...str.length - 1).each do |index|
        bigram = str[index..index + 1]
        counts[bigram] += 1
    end
    sorted = counts.sort_by { |key, value| value }
    sorted.last[0]
end


class Hash
    # Write a method, Hash#inverse, that returns a new hash where the key-value pairs are swapped
    def inverse
        hashy = {}
        self.each do |key, value|
            hashy[value] = key
        end
        hashy
    end
end


class Array
    # Write a method, Array#pair_sum_count, that takes in a target number returns the number of pairs of elements that sum to the given target
    def pair_sum_count(num)
        count = 0
        self.each_with_index do |number_1, index_1|
            self.each_with_index do |number_2, index_2|
                count += 1 if index_2 > index_1 && number_1 + number_2 == num
            end
        end
        count
    end


    # Write a method, Array#bubble_sort, that takes in an optional proc argument.
    # When given a proc, the method should sort the array according to the proc.
    # When no proc is given, the method should sort the array in increasing order.
    def bubble_sort(&prc)
        prc ||= Proc.new { |a, b| a <=> b }
        sorted = false
        while !sorted
            sorted = true
            (0...self.length - 1).each do |index|
                if prc.call(self[index], self[index + 1]) == 1
                    sorted = false
                    self[index], self[index + 1] = self[index +1], self[index]
                end
            end
        end
        self
    end
end
