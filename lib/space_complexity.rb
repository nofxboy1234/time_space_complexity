require 'pry-byebug'
require 'benchmark'
require 'benchmark/memory'

# def allocate_string
#   "this string was dynamically allocated"  
# end

# def give_frozen_string
#   "this string is frozen".freeze
# end

# Benchmark.memory do |x|
#   x.report('dynamic allocation') { allocate_string }
#   x.report('frozen string') { give_frozen_string }

#   x.compare!
# end

# O(1) - Constant Complexity
# def multiply(num1, num2)
#   num1 * num2
# end

# Benchmark.memory do |x|
#   x.report('multiply A') { multiply(3, 2) }
#   x.report('multiply B') { multiply(6, 4) }

#   x.compare!
# end



# p multiply(3, 2)

# O(N) Linear Complexity
def sum_arr(arr)
  copy_arr = arr.dup
  sum = 0
  copy_arr.each do |number|
    sum += number
  end

  sum
end

# Benchmark.memory do |x|
#   x.report('sum_arr A') { sum_arr((1..3).to_a) }
#   x.report('sum_arr B') { sum_arr((1..3000).to_a) }

#   x.compare!
# end


def sum_arr2(arr)
  sum = 0
  arr.each do |number|
    sum += number
  end
  return sum
end

Benchmark.memory do |x|
  # x.report('A') { sum_arr((1..3).to_a) }
  # x.report('B') { sum_arr((1..6).to_a) }
  # x.report('A') { sum_arr([1, 2, 3]) }
  # x.report('B') { sum_arr([1, 2, 3, 4, 5, 6]) }
  

  # x.report('A') { sum_arr2((1..3).to_a) }
  # x.report('B') { sum_arr2((1..6).to_a) }
  x.report('A') { sum_arr2([1, 2, 3]) }
  x.report('B') { sum_arr2([1, 2, 3, 4, 5, 6]) }

  x.compare!
end


# p sum_arr([1, 2, 3, 4])

# def sum_arr2(arr)
#   sum = 0
#   arr.each do |number|
#     sum += number
#   end

#   sum
# end

# def sum_hash_values(hash)
#   copy_hash = hash.dup
#   sum = 0
#   copy_hash.each do |_, value|
#     sum += value
#   end

#   sum
# end

# p sum_hash_values({ a: 1, b: 2, c: 3, d: 4 })

# # O(1) - Constant Complexity
# def get_sum(x, y, z)
#   sum = 0
#   x + y + z
#   return sum
# end

# # O(N) - Linear Complexity
# def get_sum2(array)
#   sum = 0
#   for i in [0...array.length]
#     sum += array[i]
#   end
#   return sum
# end

# def get_sum3(array)
#   size = array.length
#   if size == 1
#     return array[0]
#   else
#     return (array[0] + get_sum3(array[1...size]))
#   end
# end
