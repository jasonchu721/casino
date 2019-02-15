class Game
  def initialize
  player
  end

  def player
    puts "\nWelcome to The Casino of The Gods"
    puts "Please enter your name"
    print "> "
    player = gets.strip
    puts "You found $1k? Good for you, #{player}"
    sleep(1)
    puts "your balance is now $1000"
    sleep(1)
    @balance = 1000
    game_menu
  end
  
  def game_menu
    puts "Which game would you like to play?"
    puts "1) number_guessing_game 2) dice"
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

  # def number_guessing_game
  #   puts "Pick any number!"
  #     random_number = rand(6)
  #   puts "Pick any number between 0 and 6"
  #     guess = gets.chomp.to_i
  # until guess == random_number
  #   puts "Sorry wrong choice, you lose!!"
  #   guess = gets.chomp.to_i
  # end
  # puts "You Da Man Brah!"

  # puts "plant"


end

game = Game.new
game