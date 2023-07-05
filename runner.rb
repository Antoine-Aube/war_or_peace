require 'pry'
require './lib/card.rb'
require './lib/deck.rb'
require './lib/player.rb'
require './lib/turn.rb'

# Create 52 Cards (A standard deck)
# Put those card into two Decks (some randomness would be nice here!)
# Create two players with the Decks you created
# Start the game using a new method called start
# This method will need to be included in a class - it is up to you which class to include it in - either existing or ✨new ✨


card1 = Card.new(:hearts, "Ace", 14)
card2 = Card.new(:diamond, "Ace", 14)
card3 = Card.new(:spades, "Ace", 14)
card4 = Card.new(:clubs, "Ace", 14)
card5 = Card.new(:hearts, "King", 13)
card6 = Card.new(:diamond, "King", 13)
card7 = Card.new(:spades, "King", 13)
card8 = Card.new(:clubs, "King", 13)
card9 = Card.new(:hearts, "Queen", 12)
card10 = Card.new(:diamond, "Queen", 12)
card11 = Card.new(:spades, "Queen", 12)
card12 = Card.new(:clubs, "Queen", 12)
card13 = Card.new(:hearts, "Jack", 11)
card14 = Card.new(:diamond, "Jack", 11)
card15 = Card.new(:spades, "Jack", 11)
card16 = Card.new(:clubs, "Jack", 11)
card17 = Card.new(:hearts, "10", 10)
card18 = Card.new(:diamond, "10", 10)
card19 = Card.new(:spades, "10", 10)
card20 = Card.new(:clubs, "10", 10)
card21 = Card.new(:hearts, "9", 9)
card22 = Card.new(:diamond, "9", 9)
card23 = Card.new(:spades, "9", 9)
card24 = Card.new(:clubs, "9", 9)
card25 = Card.new(:hearts, "8", 8)
card26 = Card.new(:diamond, "8", 8)
card27 = Card.new(:spades, "8", 8)
card28 = Card.new(:clubs, "8", 8)
card29 = Card.new(:hearts, "7", 7)
card30 = Card.new(:diamond, "7", 7)
card31 = Card.new(:spades, "7", 7)
card32 = Card.new(:clubs, "7", 7)
card33 = Card.new(:hearts, "6", 6)
card34 = Card.new(:diamond, "6", 6)
card35 = Card.new(:spades, "6", 6)
card36 = Card.new(:clubs, "6", 6)
card37 = Card.new(:hearts, "5", 5)
card38 = Card.new(:diamond, "5", 5)
card39 = Card.new(:spades, "5", 5)
card40 = Card.new(:clubs, "5", 5)
card41 = Card.new(:hearts, "4", 4)
card42 = Card.new(:diamond, "4", 4)
card43 = Card.new(:spades, "4", 4)
card44 = Card.new(:clubs, "4", 4)
card45 = Card.new(:hearts, "3", 3)
card46 = Card.new(:diamond, "3", 3)
card47 = Card.new(:spades, "3", 3)
card48 = Card.new(:clubs, "3", 3)
card49 = Card.new(:hearts, "2", 2)
card50 = Card.new(:diamond, "2", 2)
card51 = Card.new(:spades, "2", 2)
card52 = Card.new(:clubs, "2", 2)

cards = [card1, card2, card3, card4, card5, card6, card7, card8, card9, card10, card11, card12, card13, card14, card15, card16, card17, card18, card19, card20, card21, card22, card23, card24, card25, card26, card27, card28, card29, card30, card31, card32, card33, card34, card35, card36, card37, card38, card39, card40, card41, card42, card43, card44, card45, card46, card47, card48, card49, card50, card51, card52 ]
cards1 = []
cards1 << cards.delete(cards.sample) until cards1.length == 26
cards2 = []
cards2 << cards.delete(cards.sample) until cards2.length == 26
# binding.pry
deck1 = Deck.new(cards1)
deck2 = Deck.new(cards2)
# binding.pry
player1 = Player.new("DJ", deck1)
player2 = Player.new("Cliff", deck2)
game1 = Turn.new(player1, player2)

game1.start
# binding.pry



