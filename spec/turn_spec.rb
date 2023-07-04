require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

RSpec.describe Turn do
  it "has players to play the turn " do 
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)    
    card3 = Card.new(:heart, '9', 9)    
    card4 = Card.new(:diamond, 'Jack', 11)    
    card5 = Card.new(:heart, '8', 8)    
    card6 = Card.new(:diamond, 'Queen', 12)    
    card7 = Card.new(:heart, '3', 3)    
    card8 = Card.new(:diamond, '2', 2)    
    deck1 = Deck.new([card1, card2, card5, card8])
    deck2 = Deck.new([card3, card4, card6, card7])  
    player1 = Player.new("Megan", deck1) 
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2) 
    expect(turn.player1.name).to eq("Megan")
  end
  it "has a type of turn" do 
      card1 = Card.new(:heart, 'Jack', 11)
      card2 = Card.new(:heart, '10', 10)    
      card3 = Card.new(:heart, '9', 9)    
      card4 = Card.new(:diamond, 'Jack', 11)    
      card5 = Card.new(:heart, '8', 8)    
      card6 = Card.new(:diamond, 'Queen', 12)    
      card7 = Card.new(:heart, '3', 3)    
      card8 = Card.new(:diamond, '2', 2)    
      deck1 = Deck.new([card1, card2, card5, card8])
      deck2 = Deck.new([card3, card4, card6, card7])  
      player1 = Player.new("Megan", deck1) 
      player2 = Player.new("Aurora", deck2)
      turn = Turn.new(player1, player2)
      expect(turn.type).to be(:basic)
  end

  it 'determines winner based on the type of turn' do
      card1 = Card.new(:heart, 'Jack', 11)
      card2 = Card.new(:heart, '10', 10)    
      card3 = Card.new(:heart, '9', 9)    
      card4 = Card.new(:diamond, 'Jack', 11)    
      card5 = Card.new(:heart, '8', 8)    
      card6 = Card.new(:diamond, 'Queen', 12)    
      card7 = Card.new(:heart, '3', 3)    
      card8 = Card.new(:diamond, '2', 2)    
      deck1 = Deck.new([card1, card2, card5, card8])
      deck2 = Deck.new([card3, card4, card6, card7])  
      player1 = Player.new("Megan", deck1) 
      player2 = Player.new("Aurora", deck2)
      turn = Turn.new(player1, player2)
      winner = turn.winner
      expect(winner).to be(player1)
  end
  it "has a spoils of war array" do 
    card1 = Card.new(:heart, 'Jack', 11)
      card2 = Card.new(:heart, '10', 10)    
      card3 = Card.new(:heart, '9', 9)    
      card4 = Card.new(:diamond, 'Jack', 11)    
      card5 = Card.new(:heart, '8', 8)    
      card6 = Card.new(:diamond, 'Queen', 12)    
      card7 = Card.new(:heart, '3', 3)    
      card8 = Card.new(:diamond, '2', 2)    
      deck1 = Deck.new([card1, card2, card5, card8])
      deck2 = Deck.new([card3, card4, card6, card7])  
      player1 = Player.new("Megan", deck1) 
      player2 = Player.new("Aurora", deck2)
      turn = Turn.new(player1, player2)
      winner = turn.winner
      # require 'pry'; binding.pry
      turn.pile_cards
      expect(turn.spoils_of_war.length).to eq(2)
      expect(winner).to be(player1)
  end
  it "does a war turn" do 
    card1 = Card.new(:heart, 'Jack', 11)    
    card2 = Card.new(:heart, '10', 10)    
    card3 = Card.new(:heart, '9', 9)    
    card4 = Card.new(:diamond, 'Jack', 11)    
    card5 = Card.new(:heart, '8', 8)    
    card6 = Card.new(:diamond, 'Queen', 12)    
    card7 = Card.new(:heart, '3', 3)    
    card8 = Card.new(:diamond, '2', 2)    
    deck1 = Deck.new([card1, card2, card5, card8])   
    deck2 = Deck.new([card4, card3, card6, card7])    
    player1 = Player.new("Megan", deck1)        
    player2 = Player.new("Aurora", deck2)    
    turn = Turn.new(player1, player2) 

    expect(turn.type).to eq(:war)

    winner = turn.winner
    expect(winner).to be(player2)

    turn.pile_cards
    # require 'pry'; binding.pry
    expect(turn.spoils_of_war.length).to eq(6)
    # require 'pry'; binding.pry
    turn.award_spoils(winner)
    expect(player2.deck.cards).to include(card1)
    # require 'pry'; binding.pry
  end
  it "awards a winner" do 
    card1 = Card.new(:heart, 'Jack', 11)    
    card2 = Card.new(:heart, '10', 10)    
    card3 = Card.new(:heart, '9', 9)    
    card4 = Card.new(:diamond, 'Jack', 11)    
    card5 = Card.new(:heart, '8', 8)    
    card6 = Card.new(:diamond, 'Queen', 12)    
    card7 = Card.new(:heart, '3', 3)    
    card8 = Card.new(:diamond, '2', 2)    
    deck1 = Deck.new([card1, card2, card5, card8])   
    deck2 = Deck.new([card4, card3, card6, card7])    
    player1 = Player.new("Megan", deck1)        
    player2 = Player.new("Aurora", deck2)    
    turn = Turn.new(player1, player2)

    winner = turn.winner
    expect(winner).to be(player2)
  end 

  it "piles cards when in a war turn " do 
    card1 = Card.new(:heart, 'Jack', 11)    
    card2 = Card.new(:heart, '10', 10)    
    card3 = Card.new(:heart, '9', 9)    
    card4 = Card.new(:diamond, 'Jack', 11)    
    card5 = Card.new(:heart, '8', 8)    
    card6 = Card.new(:diamond, 'Queen', 12)    
    card7 = Card.new(:heart, '3', 3)    
    card8 = Card.new(:diamond, '2', 2)    
    deck1 = Deck.new([card1, card2, card5, card8])   
    deck2 = Deck.new([card4, card3, card6, card7])    
    player1 = Player.new("Megan", deck1)        
    player2 = Player.new("Aurora", deck2)    
    turn = Turn.new(player1, player2)

    turn.pile_cards
    expect(turn.spoils_of_war.length).to eq(6)
  end 

    it "awards the spoils to the winner when called" do 
      card1 = Card.new(:heart, 'Jack', 11)    
      card2 = Card.new(:heart, '10', 10)    
      card3 = Card.new(:heart, '9', 9)    
      card4 = Card.new(:diamond, 'Jack', 11)    
      card5 = Card.new(:heart, '8', 8)    
      card6 = Card.new(:diamond, 'Queen', 12)    
      card7 = Card.new(:heart, '3', 3)    
      card8 = Card.new(:diamond, '2', 2)    
      deck1 = Deck.new([card1, card2, card5, card8])   
      deck2 = Deck.new([card4, card3, card6, card7])    
      player1 = Player.new("Megan", deck1)        
      player2 = Player.new("Aurora", deck2)    
      turn = Turn.new(player1, player2) 

      winner = turn.winner
      turn.pile_cards
      turn.award_spoils(winner)
      expect(player2.deck.cards).to include(card1)
      # require "pry"; binding.pry
    end 
    
    it "does a mutually assured distruction turn" do 
      card1 = Card.new(:heart, 'Jack', 11)    
      card2 = Card.new(:heart, '10', 10)    
      card3 = Card.new(:heart, '9', 9)    
      card4 = Card.new(:diamond, 'Jack', 11)    
      card5 = Card.new(:heart, '8', 8)    
      card6 = Card.new(:diamond, '8', 8)    
      card7 = Card.new(:heart, '3', 3)    
      card8 = Card.new(:diamond, '2', 2)    
      deck1 = Deck.new([card1, card2, card5, card8])    
      deck2 = Deck.new([card4, card3, card6, card7])    
      player1 = Player.new("Megan", deck1)    
      player2 = Player.new("Aurora", deck2)    
      turn = Turn.new(player1, player2) 
      
      expect(turn.type).to eq(:mutually_assured_destruction)
      winner = turn.winner
      expect(winner).to eq("No Winner")
      turn.pile_cards
      # require "pry"; binding.pry
      expect(turn.spoils_of_war).to be_empty
      expect(player1.deck.cards.length).to eq(1)
      expect(player2.deck.cards.length).to eq(1)
    end


end