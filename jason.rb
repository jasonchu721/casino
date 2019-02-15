class Game
  def initialize
  menu
  end

  def menu
    puts "Which game would you like to play?"
    puts ["1) number_guessing_game", "2) dice"]
    game = gets.to_i
    case game
    when 1
      number_guessing_game
    when 2
      dice
    else
      menu
    end
  end

  def number_guessing_game
    puts "Welcome to the number guessing game #{@player}"
    sleep(1)
    puts "How much money would you like to bet"
    bet=gets.to_i
    sleep(1)
    number = rand(1..5)
    puts "Pick any number between 1 and 5!"
    winner=false

    while winner==false
      guess=gets.to_i
      sleep(1)
      
      if guess>number then
        puts("Sorry, that number is too high")
        elsif guess<number then
        puts("Sorry, that number is too low")
        else
        puts("Congradulations, winner winner chicken dinner!")
          winner=true
          sleep(2)
        end
          puts("Would you like to play again, (y/n)?")
          response = gets.strip
      if response == "y"
        number_guessing_game
        else
        puts "Thank you for playing, I hope you lose more money"
        game_menu
      end
    end
  end




  
end
        



game = Game.new
game



