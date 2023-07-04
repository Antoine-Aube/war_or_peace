class Turn
  attr_reader :player1, :player2, :spoils_of_war
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end 
  def type 
    if player1.deck.cards[0].rank == player2.deck.cards[0].rank && player1.deck.cards[2].rank == player2.deck.cards[2].rank 
      :mutually_assured_destruction
      
      # elsif player1.deck.cards[0].value < player2.deck.cards[0].value
      #   :basic
      # elsif player1.deck.cards[0].value > player2.deck.cards[0].value
      #   :basic
    elsif player1.deck.cards[0].rank == player2.deck.cards[0].rank 
      :war
    else
      :basic
    end
  end
  def winner
    if self.type == :basic 
      player1.deck.cards[0].rank > player2.deck.cards[0].rank ? player1 : player2
    elsif self.type == :war
      player1.deck.cards[2].rank > player2.deck.cards[2].rank ? player1 : player2 
    else self.type == :mutually_assured_destruction
      "No Winner"
    end
  end
  def award_spoils(player)
    player.deck.cards << @spoils_of_war
    player.deck.cards.flatten!
    #found this flatten method which flattens self(array) when called on an array, unlike .flatten which return a new array with elements flattened
  end
  def pile_cards
    if self.type == :basic
      # @spoils_of_war << player1.deck.cards.shift
      # @spoils_of_war << player2.deck.cards.shift
      @spoils_of_war << player1.deck.cards[0]
      @spoils_of_war << player2.deck.cards[0]
    elsif self.type == :war
      @spoils_of_war << player1.deck.cards.shift(3)
      @spoils_of_war << player2.deck.cards.shift(3)
      @spoils_of_war.flatten!
    else
      player1.deck.cards.shift(3)
      player2.deck.cards.shift(3)
    end
  end
end

