class Game
  def initialize
  menu
  end

  def menu
    puts "Which game would you like to play?"
    puts ["1) blackjack," "2) greenjack"]
    game = gets.to_i
    case game
    when 1
      blackjack
    when 2
      greenjack
    else
      menu
    end
  end
end

