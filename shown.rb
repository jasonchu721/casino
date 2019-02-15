require "pry"
require "colorize"
class Dice

  @die1 = []
  @die2 = []
  def initialize
    puts "If dice total is 6 or higher you win!!".colorize(:blue)
    space
    menu
    show_dice
    show_sum
    win
  end

  def menu
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
  end 

  def show_dice
    space
    print "Die-1: ", @die1, " Die-2:", @die2
  end

  def show_sum
    space
    print " Sum of dice is ", @die1 + @die2, ".\n"
  end

  def win
    i = @die1 + @die2
    if i >= 6
      space
      sleep(1)
      puts "YOU WON".colorize(:green)
    else
      space
      sleep(1)
      puts "BETTER LUCK NEXT TIME".colorize(:red)
    end
  end
  def space 
    puts " " * 5
  end
end


Dice.new
