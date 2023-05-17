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

  sum
end

p sum_arr([1, 2, 3, 4])

def sum_arr2(arr)
  sum = 0
  arr.each do |number|
    sum += number
  end

  sum
end

def sum_hash_values(hash)
  copy_hash = hash.dup
  sum = 0
  copy_hash.each do |_, value|
    sum += value
  end

  sum
end

p sum_hash_values({ a: 1, b: 2, c: 3, d: 4 })

# O(1) - Constant Complexity
def get_sum(x, y, z)
  sum = 0
  x + y + z
  return sum
end

# O(N) - Linear Complexity
def get_sum2(array)
  sum = 0
  for i in [0...array.length]
    sum += array[i]
  end
  return sum
end

def get_sum3(array)
  size = array.length
  if size == 1
    return array[0]
  else
    return (array[0] + get_sum3(array[1...size]))
  end
end
