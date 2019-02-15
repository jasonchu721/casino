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
    puts "Pick any number!"
      random_number = rand(6)
    puts "Pick any number between 0 and 6"
      guess = gets.chomp.to_i
  until guess == random_number
    puts "Sorry wrong choice, you lose!!"
    guess = gets.chomp.to_i
  end
  puts "You Da Man Brah!"

  puts "plant"


end

