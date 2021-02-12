=begin
fix the following code
=end

def my_method(array)
  if array.empty?
    []
  elsif
    array.map do |value|
      value * value
    end
  else
    [7 * array.first]
  end
end

p my_method([])
p my_method([3])
p my_method([3, 4])
p my_method([5, 6, 7])


=begin
The above code is buggy because the elsif statement has an incorrect conditional statement. Given there is no condition given on the elsif branch,
Ruby recognises this and looks to the next line for the condition. It find the .map and it's associated block, and thus treats this as the condition.
Given this map statement returns an Array, which is truthy, the elsif block is always evaluated. Given there is no code in this block, nil
is always returned.
=end


def my_method(array)
  if array.empty?
    []
  elsif array.size == 1
    [7 * array.first]
  else
    array.map do |value|
      value * value
    end
  end
end

p my_method([]) == []
p my_method([3]) == [21]
p my_method([3, 4]) == [9, 16]
p my_method([5, 6, 7]) == [25, 36, 49]
