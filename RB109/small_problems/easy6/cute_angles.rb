=begin
Q: Write a method that takes a floating point number that represents an angle between 0 and 360 degrees and 
   returns a String that represents that angle in degrees, minutes and seconds.


1) UNDERSTAND THE PROBLEM
   INPUTS: an angle in degrees (float)
   OUTPUTS: a string (angle, minutes, seconds)
   
   PROBLEM DOMAIN:
   minute- a degree has 60 minutes
   seconds- a minute has 60 seconds
   RULES:
   - angle is between 0 and 360 degrees
   - angle to minute conversion: minute = (degree * 60) % 60
   - minute to second conversion: second = (minute * 60) % 60
   - use degree symbol to represent degree, single quote for minutes and double quotes for seconds
   - given a floating point input angle, the angle output should be a rounded down integer
   - minutes and seconds should be formatted with 2 0s as padding
   
   CLARIFYING QUESTIONS:
   whta values can the float take? it can be an float between 0 and 360
   MENTAL MODEL: given an angle in degrees, determine the number of minutes and seconds. Then, convert the angle, minutes, and
                 seconds into integers. Then, format the minutes and seconds, such that there is 2 0 padding and output.

2) EXAMPLES/TEST CASES
   Input: 0
   Output: %(0°00'00")

   Input: 76.73
   Output: %(76°43'48")

   EDGE CASES:

3) DATA STRUCTURE
   convert to integer when formatting

4) ALGORITHM
   1. convert degrees to minutes
        - minutes = (degrees * 60) % 60
   2. convert minutes to seconds
        - seconds = (minutes * 60) % 60
   3. format degrees, minutes and seconds
       - outputs degrees as an integer
       - output minute and seconds as integers and format with 00 padding

5) CODE
=end

MINUTES_PER_DEGREE = 60
SECOND_PER_MINUTE = 60

def dms(degrees)
  minutes = (degrees * MINUTES_PER_DEGREE) % MINUTES_PER_DEGREE
  seconds = (minutes * SECOND_PER_MINUTE) % SECOND_PER_MINUTE
  format("%d°%02d'%02d\"", degrees.to_i, minutes.to_i, seconds.to_i)
end

p dms(30) == %(30°00'00")
p dms(76.73) == %(76°43'48")
p dms(254.6) == %(254°36'00")
p dms(93.034773) == %(93°02'05")
p dms(0) == %(0°00'00")
p dms(360) == %(360°00'00") || dms(360) == %(0°00'00")

# futher exploration

MAX_DEGREES = 360

def dms(degrees)
  degrees %= MAX_DEGREES
  minutes = (degrees * MINUTES_PER_DEGREE) % MINUTES_PER_DEGREE
  seconds = (minutes * SECOND_PER_MINUTE) % SECOND_PER_MINUTE
  format("%d°%02d'%02d\"", degrees.to_i, minutes.to_i, seconds.to_i)
end

p dms(400) == %(40°00'00")
p dms(-40) == %(320°00'00")
p dms(-420) == %(300°00'00")