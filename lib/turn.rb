class Turn
  attr_reader :player1, :player2, :spoils_of_war
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
    # @turn_counter = 0 
  end 
  def type
    #trying out this to check if deck is empty
    # if player1.deck.cards.empty? || player2.deck.cards.empty?
    #   :game_over
    # binding.pry
    puts player1.deck.cards[0]
    puts player2.deck.cards[0]
    puts player1.deck.cards[2]
    puts player2.deck.cards[2]
    puts 
    
    if player1.deck.cards[0].rank == player2.deck.cards[0].rank && player1.deck.cards[2].rank == player2.deck.cards[2].rank 
      :mutually_assured_destruction
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
    else 
      "No Winner"
    end
  end
  def award_spoils(player)
    @spoils_of_war.shuffle!
    @spoils_of_war.each do |spoil|
      winner.deck.cards << spoil
    end
    @spoils_of_war.clear 
    #changed this to tyler's method because I liked the shuffle aspect to create some randomness in the game
    #found this flatten method which flattens self(array) when called on an array, unlike .flatten which return a new array with elements flattened
  end
  def pile_cards
    @spoils_of_war.clear
    if self.type == :basic
      # @spoils_of_war << player1.deck.cards.shift
      # @spoils_of_war << player2.deck.cards.shift
      @spoils_of_war << player1.deck.cards.shift(1)
      @spoils_of_war << player2.deck.cards.shift(1)
    elsif self.type == :war
      @spoils_of_war << player1.deck.cards.shift(3)
      @spoils_of_war << player2.deck.cards.shift(3)
      @spoils_of_war.flatten!
    else self.type == :mutually_assured_destruction
      player1.deck.cards.shift(3)
      player2.deck.cards.shift(3)
    end
  end
  # def take_turn - TRY THIS METHOD WITH A LOOP TO SIMPLIFY
  #   if player1.deck.cards[0].rank > player2.deck.cards[0].rank

  #   elsif 

  #   end

  # end
  def start
    puts "Welcome to War! (or Peace) This game will be played with 52 cards.
    The players today are #{player1.name} and #{player2.name}.
    Type 'GO' to start the game!
    ------------------------------------------------------------------ "
      start_game_with_go = gets.chomp
      while start_game_with_go != "GO"
        start_game_with_go = gets.chomp
      end
      turn_counter = 0
    if start_game_with_go == "GO"
    
      while turn_counter < 100 && !player1.has_lost? && !player2.has_lost?
              # if self.type == :basic\
        turn_counter += 1
        # winner = self.winner
        # self.pile_cards
        # if self.type == :basic || :war
        #   award_spoils(winner)
        # end
        # # binding.pry
        # player1.deck.remove_card
        # player2.deck.remove_card
        # binding.pry
        #Removing cards made the game flow but I feel like I'm just removing the card from the players deck and not shuffling it back in

        # binding.pry
        # if self.type == :game_over && player1.deck.cards.empty? || player2.deck.cards.empty?
        #   puts "GAME OVER"
        if self.type == :basic
          winner = self.winner
          self.pile_cards
          puts "Turn #{turn_counter.to_s}: #{winner.name} won #{spoils_of_war.length.to_s} cards." 
          award_spoils(winner)
        elsif self.type == :war
          winner = self.winner
          self.pile_cards
          puts "Turn #{turn_counter.to_s}: #{self.type.to_s.upcase}  #{winner.name} won #{spoils_of_war.length.to_s} cards."
          award_spoils(winner)
        else self.type == :mutually_assured_destruction
          binding.pry
          puts "Turn #{turn_counter.to_s}: *mutually assured destruction* 6 cards removed from play"
        end 
      end 
      # binding.pry

      if player1.has_lost?
        puts "#{player1.name} has WON THE GAME"
      elsif player2.has_lost?
        puts "#{player1.name} has WON THE GAME"
      else 
        puts "DRAW"
      end
    end
  end
end

def staart
  puts "Welcome to War! (or Peace) This game will be played with 52 cards.
  The players today are #{player1.name} and #{player2.name}.
  Type 'GO' to start the game!
  ------------------------------------------------------------------ "
    start_game_with_go = gets.chomp.to_s
    turn_counter = 0
  if start_game_with_go == "GO"
    loop do 
        turn_counter += 1
        winner = self.winner
        self.pile_cards
        award_spoils(winner)
        # # binding.pry
        # player1.deck.remove_card
        # player2.deck.remove_card
        binding.pry
        #Removing cards made the game flow but I feel like I'm just removing the card from the players deck and not shuffling it back in

        # binding.pry
        # if self.type == :game_over && player1.deck.cards.empty? || player2.deck.cards.empty?
        #   puts "GAME OVER"
        if self.type == :basic
          
          puts "Turn #{turn_counter.to_s}: #{winner.name} won #{spoils_of_war.length.to_s} cards." 
        elsif self.type == :war
         
          puts "Turn #{turn_counter.to_s}: #{self.type.to_s.upcase}  #{winner.name} won #{spoils_of_war.length.to_s} cards."
        else self.type == :mutually_assured_destruction

          puts "Turn #{turn_counter.to_s}: #{self.type.to_s} #{winner.name} won #{spoils_of_war.length.to_s} cards."
        end
        if player1.has_lost?
          puts "#{player1.name} has WON THE GAME"
        elsif player2.has_lost?
          puts "#{player1.name} has WON THE GAME"
        else 
          puts "DRAW"
        end 
      end 
    end
  end


#   start_game_with_go = gets.chomp.to_s

#     if start_game_with_go == "GO"
#       while @turn_counter < 5000 && !player1.deck.cards.empty? && !player2.deck.cards.empty?
#       @turn_counter += 1

#       self.pile_cards
#       winner = self.winner
#       award_spoils(winner)
      

#       case self.type
#       when :basic
#         puts "Turn #{@turn_counter.to_s}: #{winner.name} won #{spoils_of_war.length.to_s} cards."
#       when :war
#         puts "Turn #{@turn_counter.to_s}: WAR - #{winner.name} won #{spoils_of_war.length.to_s} cards."
#       when :mutually_assured_destruction
#         puts "Turn #{@turn_counter.to_s}: *MUTUALLY ASSURED DESTRUCTION* - No winner, #{spoils_of_war.length.to_s} cards removed from play."
#       end
#     end

#     if @turn_counter == 5000
#       puts "---DRAW---"
#     else
#       winning_player = player1.deck.cards.empty? ? player2 : player1
#       puts "*~*~*~* #{winning_player.name} has won the game! *~*~*~*"
#     end
#   end
# end
  
