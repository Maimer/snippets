require 'set'

def max_subarray(array)
  max_here, max_so_far = 0, 0
  array.each do |num|
    max_here = [0, max_here + num].max
    max_so_far = [max_so_far, max_here].max
  end
  max_so_far
end

# puts max_subarray([-2,1,-3,4,-1,2,1,-5,4])

def remove_dups(array)
  num_hash = {}
  unique_nums = []
  array.each do |num|
    num_hash[num] = :true
  end
  num_hash.each_key { |num| unique_nums << num }
  unique_nums
end

# puts remove_dups([1,4,2,1,5,4,2,3,1])

def second_frequent(array)
  num_hash = {}
  array.each { |num| num_hash[num].nil? ? num_hash[num] = 1 : num_hash[num] += 1 }
  num_hash.sort_by { |num, value| value }[-2][0]
end

# puts second_frequent([1,2,3,4,5,6,2,3,2,3,1,2,3,5,4,5,6,3,2,1,3])

def camel_case(input)
  input.split(' ').map! { |word| word.capitalize }.join.gsub!(/\A[A-Z]/, Hash[('A'..'Z').map { |l| [l, l.downcase] }])
end

puts camel_case("Groupon is awesome")

class Numeric
  def ordinal
    cardinal = self.to_i.abs
    if (10...20).include?(cardinal) then
      cardinal.to_s << 'th'
    else
      cardinal.to_s << %w{th st nd rd th th th th th th}[cardinal % 10]
    end
  end
end

[1, 22, 123, 10, -3.1415].collect { |i| puts i.ordinal }

