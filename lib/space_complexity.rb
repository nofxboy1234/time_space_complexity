# O(1) - Constant Complexity
def multiply(num1, num2)
  num1 * num2
end

p multiply(3, 2)

# O(N) Linear Complexity
def sum_arr(arr)
  copy_arr = arr.dup
  sum = 0
  copy_arr.each do |number|
    sum += number
  end

  return sum
end

p sum_arr([1, 2, 3, 4])

def sum_hash_values(hash)
  copy_hash = hash.dup
  sum = 0
  copy_hash.each do |_, value|
    sum += value
  end
  
  return sum
end

p sum_hash_values({a: 1, b: 2, c: 3, d: 4})
