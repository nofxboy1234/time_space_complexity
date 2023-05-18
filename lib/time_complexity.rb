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

Benchmark.bm do |x|
  x.report('A') { scramble('abcdef', 'abcdef') }
  x.report('B') { scramble2('abcdef', 'abcdef') }
  x.report('C') { scramble3('abcdef', 'abcdef') }
end


Benchmark.ips do |x|
  x.report('A') { scramble('abcdef', 'abcdef') }
  x.report('B') { scramble2('abcdef', 'abcdef') }
  x.report('C') { scramble3('abcdef', 'abcdef') }

  x.compare!
end

Benchmark.ips do |x|
  x.report('A') { scramble('fedcba', 'abcdef') }
  x.report('B') { scramble2('fedcba', 'abcdef') }
  x.report('C') { scramble3('fedcba', 'abcdef') }

  x.compare!
end