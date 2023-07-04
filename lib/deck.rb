class Deck
  attr_reader :cards
  def initialize(cards)
    @cards = cards
    @high_cards = []
  end
  def rank_of_card_at(index)
      self.cards[index].rank
  end
  def high_ranking_cards
    @high_cards.clear
    self.cards.each do |card|
       @high_cards << card if card.rank >= 11
    end
    @high_cards
  end
  def percent_high_ranking
    percentage = @high_cards.length.to_f / @cards.length.to_f * 100
    percentage.round(2)
  end
  def remove_card
    @cards.shift
  end
  def add_card(card)
    @cards.push(card)
  end
end