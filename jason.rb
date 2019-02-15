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
<<<<<<< HEAD
    puts "Pick any number!"
      random_number = rand(6)
    puts "Pick any number between 0 and 6"
      guess = gets.chomp.to_i
  until guess == random_number
    puts "Sorry wrong choice, you lose!!"
    guess = gets.chomp.to_i
  end
  puts "You Da Man Brah!"




end
=======
    puts "Welcome to the number guessing game #{@player}"
    sleep(1)
    puts "How much money would you like to bet"
    #intake player bet
      number = rand(1..5)
    puts "Pick any number between 1 and 5!"
    winner=false

    while winner==false
      guess=gets.to_i
      
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


>>>>>>> c6f883d1c94fe8457db52ce99de80fb050964ba8

