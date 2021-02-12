cards = [2, 3, 4, 5, 6, 7, 8, 9, 10, :jack, :queen, :king, :ace]

deck = { :hearts   => cards.clone,
         :diamonds => cards.clone,
         :clubs    => cards.clone,
         :spades   => cards.clone }

def score(card)
  case card
  when :ace   then 11
  when :king  then 10
  when :queen then 10
  when :jack  then 10
  else card
  end
end

# Pick one random card per suit

player_cards = []
deck.keys.each do |suit|
  cards = deck[suit]
  cards.shuffle!
  player_cards << cards.pop
end

# Determine the score of the remaining cards in the deck

sum = deck.reduce(0) do |sum, (_, remaining_cards)|
  card_values = remaining_cards.map do |card|
                  score(card)
                end

  sum += remaining_cards.sum
end

puts sum

# first error was that the return array of final map  was not being saved. Always note what is happening to return values of methods. Second bug
# was that a destructive operation was happening on an array. Given the cards array was shared by multiple hash keys, the changes made were
# reflected across all card array, when it was intended just to show on a single hash key corresponding array. This was fixed by cloning each
# array such that each hash key was pointing to different array objects, and thus any chnages on a given array was not reflected in all of the others.