require "pry"
require "colorize"

class Game
  def initialize
  player
  end

  def player
    puts "\nWelcome to The Casino of The Gods"
    puts "Please enter your name"
    print "> "
    @player = gets.strip
    puts "You found $1k? Good for you, #{@player}"
    sleep(1)
    puts "your balance is now $1000"
    sleep(1)
    @balance = 1000
    game_menu
  end
  
  def game_menu
    puts "Which game would you like to play?"
    puts "1) number_guessing_game 2) dice 3) Quit"
    game = gets.to_i
    case game
    when 1
      number_guessing_game
    when 2
      Dice
    when 3
      exit
    else
      game_menu
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
        
class Dice

  @die1 = []
  @die2 = []
  def initialize
    menu
  end

  def menu
    puts "If dice total is 6 or higher you win!!".colorize(:blue)
    puts "Press 1 to roll".colorize(:yellow)
    case gets.to_i
      when 1
        roll
      else
        menu
    end
  end
  def roll
    @die1 = 1 + rand(6)
    @die2 = 1 + rand(6)
    show_dice
  end 

  def show_dice
    space
    print "Die-1: ", @die1, " Die-2: ", @die2
    show_sum
  end

  def show_sum
    space
    print " Sum of dice is ", @die1 + @die2, ".\n"
    win
  end

  def win
    i = @die1 + @die2
    if i >= 6
      space
      sleep(1)
      puts "YOU WON".colorize(:green)
      play_again
    else
      space
      sleep(1)
      puts "BETTER LUCK NEXT TIME".colorize(:red)
      play_again
    end

  end
  def space 
    puts " " * 5
  end
  def play_again
    puts "Do you want to play again? Yes or No?"
    case gets.strip
    when "yes"
      menu
    else
      @game.game_menu
    end
  end
end




@game = Game.new
dice = Dice.new

game