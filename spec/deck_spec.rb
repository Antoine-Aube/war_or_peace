require 'rspec'
require './lib/card'
require './lib/deck'

RSpec.describe Deck do 
  it 'has cards in the deck' do 
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    # require 'pry'; binding.pry
    expect(deck.cards[1].suit).to eq(:spade)
  end

  it "knows card rank based on index" do 
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    expect(deck.rank_of_card_at(0)).to eq(12)
    expect(deck.rank_of_card_at(2)).to eq(14)
  end
  
  it "store high ranking cards" do 
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    expect(deck.high_ranking_cards[0].suit).to be(:diamond)
    # require 'pry'; binding.pry
  end
  
  it "calculates percentage of high cards in deck" do 
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    deck.high_ranking_cards
    expect(deck.percent_high_ranking).to eq(66.67)
  end
  it "can have a card removed from it" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    deck.remove_card
    
    expect(deck.cards.length).to eq(2)
    expect(deck.high_ranking_cards[0].suit).to be(:heart)
    expect(deck.percent_high_ranking).to eq(50.0)
  end
  it "can have a card added to it" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    card4 = Card.new(:club, '5', 5)

    deck.add_card(card4)
    deck.remove_card

    expect(deck.cards.length).to eq(3)
    expect(deck.cards).to include(card4)
    deck.high_ranking_cards
    expect(deck.percent_high_ranking).to eq(33.33)
    # require 'pry'; binding.pry
  end 
end