arr = ['snow', 'winter', 'ice', 'slippery', 'salted roads', 'white trees']
new_arr = arr.delete_if {|element| element.start_with?("s")}
p new_arr

arr = ['snow', 'winter', 'ice', 'slippery', 'salted roads', 'white trees']
another_new_arr = arr.delete_if { |element| element.start_with?("s", "w")}
p another_new_arr

