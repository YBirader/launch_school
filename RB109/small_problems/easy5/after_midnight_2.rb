=begin
Q: Write two methods that each take a time of day in 24 hour format, and return the number of minutes before
   and after midnight, respectively. Both methods should return a value in the range 0..1439

1) UNDERSTAND THE PROBLEM
   INPUTS: string (hh:mm)
   OUTPUTS: integer, number of hours after midnight
   PROBLEM DOMAIN:
   day- a day has 24hrs, 1440 minutes
   RULES:
   - input contains hours and minutes
   - hours to minutes conversion: hours * 60
   - total minutes = hours * 60 + minutes
   - max number of minutes in day is 1440
   - minutes after midnight = total minutes % 1440
   - minutes befor midnight = 1440 - (total minutes % 1440)
   CLARIFYING QUESTIONS:
   MENTAL MODEL: Given a time in 24 hour format, get the number of hours and minutes and return the minutes after midnight 
                 and the minutes before midnight.

2) EXAMPLES/TEST CASES
   Input: '12:34'
   Output: 754

   Input: '24:00'
   Output: 0



   EDGE CASES:

3) DATA STRUCTURE
   split hour and minutes in string into array.

4) ALGORITHM
   1. retrive the hour and minutes of input
       - split string into 2 element array, where first element is hr and second element is minute, using ':' as delimiter
       - convert each element to an integer
   2. find the total number of minutes after/before midnight
        - create variable called total_minutes = hours * 60 + minutes for after midnight
        - create variable called total_minutes =  1400 - hours * 60 + minutes before midnight
        - minutes after/before midnight = total minutes % 1440
   3. return minutes after midnight and minutes before midnight

5) CODE
=end

MINUTES_IN_HOUR = 60
MINUTES_IN_DAY = 1440

def after_midnight(time)
  hours, minutes = time.split(':').map(&:to_i)
  total_minutes = hours * MINUTES_IN_HOUR + minutes
  total_minutes % MINUTES_IN_DAY
end

def before_midnight(time)
  hours, minutes = time.split(':').map(&:to_i)
  total_minutes = MINUTES_IN_DAY - (hours * MINUTES_IN_HOUR + minutes)
  total_minutes % MINUTES_IN_DAY
end

p after_midnight('00:00') == 0
p before_midnight('00:00') == 0
p after_midnight('12:34') == 754
p before_midnight('12:34') == 686
p after_midnight('24:00') == 0
p before_midnight('24:00') == 0
