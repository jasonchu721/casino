require "pry"
require "colorize"
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
      Game.game_menu
    end
  end
end


Dice.new
