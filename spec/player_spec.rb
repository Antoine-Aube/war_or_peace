require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'

RSpec.describe Player do 
  it "has a name and a deck of cards" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    deck = Deck.new([card1, card2, card3])
    player = Player.new('Clarisa', deck)

    expect(player.name).to eq('Clarisa')
    expect(player.deck.cards).to include(card2)
  end

  it "has a boolean variable determining if it has lost" do 
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    deck = Deck.new([card1, card2, card3])
    player = Player.new('Clarisa', deck)
    
    3.times {player.deck.remove_card}
    # require 'pry'; binding.pry
    expect(player.has_lost?).to be true 
  end
end