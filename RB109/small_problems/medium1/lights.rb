=begin
Q: Write a method that takes one argument, the total number of switches, and returns an Array that identifies which lights
   are on after n repetitions e.g. if n = 5, there are 5 lights and lights [1, 3, 5] are on. If n = 10, there are 10 lights and 
   lights [1, 4, 9] will still be on.


1) UNDERSTAND THE PROBLEM
   INPUTS: the number of lights (integer)
   OUTPUTS: the lights that are still on (array)
   
   PROBLEM DOMAIN:
   
   RULES:
   - there are n lights
   - all the lights are switched on during the first repetition
   - each light has 2 states- on or off
   - lights can be toggled any number of times between the two states e.g. on then off then on etc.
   - lights are toggles on each ith round, where i = (2..n)
   - if ith round (i=2..n), then lights light_number % i == 0 are toggled

   CLARIFYING QUESTIONS:
   
   MENTAL MODEL: Given an integer n, initalise n lights in the on state. Then, iterate through the array n-1 times, where on the ith repetition
   (i=2..n), then lights at light_number % i == 0 are toggled. Return the number of the lights which are left on.

2) EXAMPLES/TEST CASES
   Input: 5
   Output: [1, 4]

   Input: 10
   Output: [1, 4, 9]
   
   EDGE CASES:
   Input: 1
   Output:  [1]

3) DATA STRUCTURE
   array of booleans where true = light on, false = light off

4) ALGORITHM
   1. Initialise n lights on
        - create an array of n elements where each element is true called lights
   2. Iterate through lights n-1 times, toggling the required lights
        - create variable called i = 2
        - while i <= n
            - for each light in lights with index
                if index + 1 % i == 0
                  map light to opposite boolean
            increment i 
   3. Filter array for lights which are on
        - create an empty array called result = []
        - for each light in lights with index
            if light == true
               append index + 1 to result
   4. return result         

5) CODE
=end

def lights_on(n)
	lights = [false] * n 
	i = 1
	while i <= n 
		lights.map!.with_index do |status, light_num|
			(light_num + 1) % i == 0 ? !status : status
		end
		i += 1
	end
	result = []
	lights.each_with_index do |status, light_num|
	result.push(light_num + 1) if status
	end
	result
end

p lights_on(5) == [1, 4]
p lights_on(10) == [1, 4, 9]
p lights_on(1000)

=begin
all lights which are left on are square numbers. We look at the number of factors each number has.
This corresponds to the number of times the switch is toggled. If a number has an even number of factors, then
the switch will retain its original state i.e. off. In contrast, if a number has an odd number of factors, then the
switch will flip state i.e. will be on. Given only square numbers have an odd number of factors, thus only lights
at positions which are square are on.

# method 2
=end

def initialise_lights(n)
	lights = {}
	1.upto(n) do |light_num|
		lights[light_num] = false
	end
	lights
end

def on_lights(lights)
	lights.select { |light_num, status| status }.keys
end

def off_lights(lights)
  lights.reject { |light_num, status| status }.keys
end

def toggle_every_nth_light(lights, nth)
	lights.each do |light_num, status|
		lights[light_num] = !status if light_num % nth == 0
		end
end 

def format_output(lights, state='off', delimiter=', ')
  required_lights = (state == 'off') ? off_lights(lights) : on_lights(lights)
  case required_lights.size
  when 0 then ''
  when 1 then required_lights[0].to_s + ' is'
  when 2 then required_lights[0].to_s + ' and ' + required_lights[1].to_s + ' are'
  else
    *rest, last = required_lights
    rest.join(delimiter) + delimiter + 'and ' + last.to_s + ' are'
  end
end 

def toggle_lights(n)
	lights = initialise_lights(n)
	1.upto(n) do |i|
		toggle_every_nth_light(lights, i)
	end
	
  puts "lights #{format_output(lights)} now off."
  puts "lights #{format_output(lights, 'on')} on."
end

p toggle_lights(1)
p toggle_lights(5) == [1, 4]
p toggle_lights(10) == [1, 4, 9]
p lights_on(1000)







