def dice
  @die1 = []
  @die2 = []
  puts "Welcome to the Dice Roll game #{@player}"
  sleep(1)
  puts "How much money would you like to bet"
  bet=gets.to_i
  sleep(1)
  puts "If dice total is 6 or higher you win"
  puts "Press 1 to roll."

  case gets.to_i
    when 1
      @die1 = 1 + rand(6)
      @die2 = 1 + rand(6)
    else
      dice
  end
  print "Die-1: ", @die1, " Die-2: ", @die2
  i = @die1 + @die2
  if i >= 6
    sleep(1)
    puts "YOU WON".colorize(:green)
  else
    sleep(1)
    puts "BETTER LUCK NEXT TIME".colorize(:red)
  end
  puts "Do you want to play again? Yes or No?"
    case gets.strip
    when "yes"
      dice
    else
      Game
    end
  end
