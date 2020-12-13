=begin
Q: Create a simple tip calculator. The program should prompt for a bill amount and a tip rate. The program
   must compute the tip, then display both the tip and the total amount of the bill. 

1) UNDERSTAND THE PROBLEM
   INPUTS: bill, tip rate
   OUTPUTS: tip, total bill
   PROBLEM DOMAIN:
   
   RULES:
   0. tip rate is given as a percentage
   1. tip is bill * (tip rate / 100)
   2. total bill = bill + tip
   3. Answer should be given to 2dp
   CLARIFYING QUESTIONS:
   1. Assume valid input? yes
   
   MENTAL MODEL: Given the tip rate and bill, compute the total tip and add that to the bill. display
                 this total bill.

2) EXAMPLES/TEST CASES
   Input: 200, 15
   Output: £30.00, £230.00

   EDGE CASES:

3) DATA STRUCTURE

4) ALGORITHM
   0. Determine the tip = bill * (tip_rate / 100)
   1. total_bill  = tip + bill
   2. Display in required format

5) CODE
=end

def retrieve_bill
  print ">> What is the bill? "
  bill = gets.chomp.to_f
end

def retrieve_tip_rate
  print ">> What is the tip percentage? "
  tip_rate = gets.chomp.to_f
end

def compute_tip(bill, tip_rate)
  bill * (tip_rate / 100)
end

def compute_total(bill, tip)
  bill + tip
end

def display_result(tip, total)  # further-exploration- add format for currency
  puts "The tip is £#{format('%.2f', tip.round(2))}"
  puts "The total is £#{format('%.2f', total.round(2))}"
end

bill = retrieve_bill()
tip_rate = retrieve_tip_rate()
tip = compute_tip(bill, tip_rate)
total = compute_total(bill, tip)
display_result(tip, total)
