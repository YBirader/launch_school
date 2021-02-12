=begin
Q: Write a method that takes two arguments, an array and a hash. The array will contain 2 or more elements that, when combined with adjoining spaces,
   will produce a persons name. The hash will contain two keys; :title and :occupation, and the approporiate values. Your method should return a greeting that
   uses the persons full name and mentions the persons title and occupation.
=end

def greetings(name, details)
  "Hello #{name.join(' ')}! Nice to have a #{details[:title]}"\
   " #{details[:occupation]} around."
end

puts greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })