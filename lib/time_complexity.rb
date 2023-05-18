require 'pry-byebug'
require 'benchmark'
require 'benchmark/ips'

# O(n) - Linear Time Complexity
# p [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].select(&:even?)

# O(n^2) - Quadratic Time Complexity
def scramble(characters, word)
  # binding.pry
  word.each_char.all? { |c| characters.count(c) >= word.count(c) }
end

# p scramble('hello worl', 'hello world')
# p scramble('hello world', 'hello world')
# p scramble('ollhe dlrow', 'hello world')
# p scramble('ollhe dlrow', 'hello worlds')

# O(n^2) - Quadratic Time Complexity
def scramble2(characters, word)
  characters = characters.dup
  word.each_char.all? { |c| characters.sub!(c, '') }
end

# p scramble2('hello worl', 'hello world')
# p scramble2('hello world', 'hello world')
# p scramble2('ollhe dlrow', 'hello world')
# p scramble2('ollhe dlrow', 'hello worlds')

# O(n) - Linear Time Complexity
def scramble3(characters, word)
  available = Hash.new(1)
  
  characters.each_char { |c| available[c] += 1 }
  word.each_char.all? { |c| available[c] -= 1; available[c] > 0 }
end

# p scramble3('hello worl', 'hello world')
# p scramble3('hello world', 'hello world')
# p scramble3('ollhe dlrow', 'hello world')
# p scramble3('ollhe dlrow', 'hello worlds')

# n = 100
# Benchmark.bm do |x|
#   x.report('A') { for i in 1..n; a = '1'; end }
#   x.report('B') { n.times do; a = '1'; end }
#   x.report('C') { 1.upto(n) do; a = '1'; end }
# end

# n = 100
# Benchmark.ips do |x|
#   x.report('A') { for i in 1..n; a = '1'; end }
#   x.report('B') { n.times do; a = '1'; end }
#   x.report('C') { 1.upto(n) do; a = '1'; end }

#   x.compare!
# end

# Benchmark.bm do |x|
#   x.report('A') { scramble('abc', 'abc') }
#   x.report('B') { scramble('abcdef', 'abcdef') }
#   x.report('C') { scramble('abcdefghi', 'abcdefghi') }
# end


# Benchmark.ips do |x|
#   x.report('A') { scramble('abc', 'abc') }
#   x.report('B') { scramble('abcdef', 'abcdef') }

#   x.compare!
# end

# Benchmark.ips do |x|
#   x.report('A') { scramble3('abc', 'abc') }
#   x.report('B') { scramble3('abcdef', 'abcdef') }

#   x.compare!
# end

# Benchmark.bm do |x|
#   x.report('A') { scramble('abcdef', 'abcdef') }
#   x.report('B') { scramble2('abcdef', 'abcdef') }
#   x.report('C') { scramble3('abcdef', 'abcdef') }
# end

# Benchmark.ips do |x|
#   x.report('A') { scramble('abcdef', 'abcdef') }
#   x.report('B') { scramble2('abcdef', 'abcdef') }
#   x.report('C') { scramble3('abcdef', 'abcdef') }

#   x.compare!
# end

# Benchmark.ips do |x|
#   x.report('A') { scramble('fedcba', 'abcdef') }
#   x.report('B') { scramble2('fedcba', 'abcdef') }
#   x.report('C') { scramble3('fedcba', 'abcdef') }

#   x.compare!
# end

# Benchmark.ips do |x|
#   x.report('A') { scramble3('abcdef', 'abcdef') }
#   x.report('B') { scramble3('abcdefabcdef', 'abcdefabcdef') }

#   x.compare!
# end

# Benchmark.ips do |x|
#   x.report('A') { [1, 2, 3, 4, 5][2] }
#   x.report('B') { [1, 2, 3, 4, 5, 6, 7, 8, 9, 10][7] }

#   x.compare!
# end


# O(1) - Constant Complexity
# def get_element(arr, index)
#   arr[index]
# end

# Benchmark.ips do |x|
#   x.report('A') { get_element([1, 2, 3, 4, 5], 2) }
#   x.report('B') { get_element([1, 2, 3, 4, 5, 6, 7, 8, 9, 10], 7) }

#   x.compare!
# end

# O(log N) - Logarithmic Complexity
# https://www.desmos.com/calculator/md3ixnavqb
def binary_search(arr, value)
  arr.bsearch do |element| 
    # puts 'bsearch'
    # element >= value # Find-minimum mode
    value <=> element # Find-any mode
  end
end

Benchmark.ips do |x|
  # log(1) = 0
  x.report('A') { binary_search([7], 7) }
  # log(2) = 0.3
  x.report('B') { binary_search([7, 8], 7) }
  # log(4) = 0.6
  x.report('C') { binary_search([7, 8, 9, 10], 7) }
  # log(8) = 0.9
  x.report('D') { binary_search([3, 4, 5, 6, 7, 8, 9, 10], 3) }
  
  x.compare!
end


# Warming up --------------------------------------
#                    A   724.955k i/100ms
#                    B   555.951k i/100ms
#                    C   431.640k i/100ms
#                    D   369.065k i/100ms
# Calculating -------------------------------------
#                    A      7.176M (± 2.0%) i/s -     36.248M in   5.053020s
#                    B      5.351M (± 3.5%) i/s -     27.242M in   5.097288s
#                    C      4.191M (± 7.3%) i/s -     21.150M in   5.081732s
#                    D      3.649M (± 2.0%) i/s -     18.453M in   5.059301s

# Comparison:
#                    A:  7176296.3 i/s
#                    B:  5350983.2 i/s - 1.34x  slower
#                    C:  4191471.2 i/s - 1.71x  slower
#                    D:  3648839.1 i/s - 1.97x  slower

# dylan@dylan-Modern-14-B11MOL:~/repos/time_space_complexity$ ruby lib/time_complexity.rb 
# Warming up --------------------------------------
#                    A   832.190k i/100ms
#                    B   639.686k i/100ms
#                    C   501.449k i/100ms
#                    D   420.404k i/100ms
# Calculating -------------------------------------
#                    A      8.467M (± 0.6%) i/s -     42.442M in   5.012733s
#                    B      6.371M (± 0.6%) i/s -     31.984M in   5.020290s
#                    C      5.006M (± 0.7%) i/s -     25.072M in   5.009027s
#                    D      4.198M (± 0.8%) i/s -     21.020M in   5.007133s

# Comparison:
#                    A:  8467068.3 i/s
#                    B:  6371226.8 i/s - 1.33x  slower
#                    C:  5005733.6 i/s - 1.69x  slower
#                    D:  4198304.1 i/s - 2.02x  slower


# p binary_search([7], 7)
# p binary_search([7, 8], 7)
# p binary_search([7, 8, 9, 10], 7)

# p binary_search([3, 4, 5, 6, 7, 8, 9, 10], 3)

# p binary_search([1, 2, 3, 4, 5, 6, 7, 8, 9, 10], 7)
