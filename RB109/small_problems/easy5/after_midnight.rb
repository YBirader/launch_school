=begin
Q: Write a method that takes a time using a minute-based format, where negative minutes are before 12AM and positive minutes are 
   after 12AM, and return the time in 24hr format i.e. hh:mm.  The method should work with any integer input.

1) UNDERSTAND THE PROBLEM
   INPUTS: integer (minutes before or after 12AM)
   OUTPUTS: string- time in 24hr format- hh:mm
   PROBLEM DOMAIN:
   day- a day has 24 * 60 = 1440 minutes 
   RULES:
   - any integer can be given.
   - maximum number of minutes in a day is 1440.
   - maximum number of hours in day is 24
   - minutes before or after 0 is => minutes % 1440
   - minutes to hrs = minutes / 60
   CLARIFYING QUESTIONS:
   MENTAL MODEL: given a time of day in minutes, find the number of minutes before or after 0 (12AM). Then, find this in terms of 
                 complete hours and remaining minutes.

2) EXAMPLES/TEST CASES
   Input: 120
   Output: '02:00'

   EDGE CASES:
   Input: 1440
   Output: '00:00'

3) DATA STRUCTURE
   

4) ALGORITHM
   1. find the number of minutes before or after 12AM
       - create a variable called minutes = time % MINUTES_IN_DAY
   2. find the number of whole hours and remaining minutes 
        - create variables, hours = minutes as float / MINUTES_IN_HOUR and remaining_minutes = minutes as float % MINUTES_IN_HOUR
   3. format hours and minutes in 24hr format i.e. hh:mm
   4. return "hours:minutes"

            

5) CODE
=end

MINUTES_IN_HOUR = 60
HOURS_IN_DAY = 24
MINUTES_IN_DAY = MINUTES_IN_HOUR * HOURS_IN_DAY

def time_of_day(time)
  minutes = time % MINUTES_IN_DAY
  hours, remaining_minutes = minutes.divmod(MINUTES_IN_HOUR)
  format('%02d:%02d', hours, remaining_minutes)
end
  
p time_of_day(0) == "00:00"
p time_of_day(-3) == "23:57"
p time_of_day(35) == "00:35"
p time_of_day(-1437) == "00:03"
p time_of_day(3000) == "02:00"
p time_of_day(800) == "13:20"
p time_of_day(-4231) == "01:29"

# further exploration
SECONDS_IN_MINUTE = 60


def time_of_day(delta_minutes)
  delta_seconds = delta_minutes * SECONDS_IN_MINUTE
  time = Time.new(2020, 12, 27, 0, 0, 0) + delta_seconds
  time.strftime("%A %I:%M")
end

p time_of_day(-4231)



