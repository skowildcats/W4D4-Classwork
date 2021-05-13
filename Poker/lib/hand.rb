require_relative 'card.rb'
require_relative 'deck.rb'

class Hand
    attr_reader :cards

    def initialize(cards)
        @cards = cards
    end

    def one_pair
        values = cards.map {|card| card.value}
        count = Hash.new(0)
        values.each do |ele|
            count[ele] += 1 
        end
        count.select {|k,v| v == 2}.length == 1
    end

    def two_pairs
        values = cards.map {|card| card.value}
        count = Hash.new(0)
        values.each do |ele|
            count[ele] += 1 
        end
        count.select {|k,v| v == 2}.length == 2
    end

    def trips
        values = cards.map {|card| card.value}
        count = Hash.new(0)
        values.each do |ele|
            count[ele] += 1 
        end
        count.select {|k,v| v == 3}.length == 1
    end

    def quads
      values = cards.map {|card| card.value}
      count = Hash.new(0)
        values.each do |ele|
            count[ele] += 1 
        end
        count.select {|k,v| v == 4}.length == 1
    end

    def straight
      values = cards.map {|card| card.to_i}
      values.uniq.length == 5 && (values.sort.first + 4 == values.sort.last)
    end

    def flush
      suits = cards.map {|card| card.suit}
      suits.any? {|suit| suits.count(suit) == 5}
    end

    def full_house
      trips && one_pair
    end

    def straight_flush 
      straight && flush
    end

    def royal_flush 
      (straight && flush) && cards.any? {|card| card.value == 'A'}
    end

    CARD_RANKING = {'rf' => 10,
    'sf' => 9,
    'q' => 8,
    'fh' => 7,
    'f' => 6,
    's' => 5,
    't' => 4,
    'tp' => 3,
    'op' => 2,
    'h' => 1}
    def best_hand
      case true
      when self.royal_flush
        return CARD_RANKING['rf']
      when self.straight_flush
        return CARD_RANKING['sf']
      when self.quads
        return CARD_RANKING['q']
      when self.full_house
        return CARD_RANKING['fh']
      when self.flush
        return CARD_RANKING['f']
      when self.straight
        return CARD_RANKING['s']
      when self.trips
        return CARD_RANKING['t']
      when self.two_pairs
        return CARD_RANKING['tp']
      when self.one_pair
        return CARD_RANKING['op']
      end

      return CARD_RANKING['h']
    end

    def > (other_hand)
      return true if self.best_hand > other_hand.best_hand
      false
    end

end

d = Deck.new()
card1 = d.deck.sample
card2 = d.deck.sample
card3 = d.deck.sample
card4 = d.deck.sample
card5 = d.deck.sample

card6 = d.deck.sample
card7 = d.deck.sample
card8 = d.deck.sample
card9 = d.deck.sample
card10 = d.deck.sample
p card1, card2, card3, card4, card5
puts
p card6, card7, card8, card9, card10
puts
hand = Hand.new([card1, card2, card3, card4, card5])
hand2 = Hand.new([card6, card7, card8, card9, card10])

p hand.best_hand
p hand2.best_hand
p hand > hand2


# p hand.straight
# num = hand.best_hand
# while num != 7

#   card1 = d.deck.sample
#   card2 = d.deck.sample
#   card3 = d.deck.sample
#   card4 = d.deck.sample
#   card5 = d.deck.sample
#   hand = Hand.new([card1, card2, card3, card4, card5])
#   p card1, card2, card3, card4, card5
#   num = hand.best_hand
#   p num 
# end


