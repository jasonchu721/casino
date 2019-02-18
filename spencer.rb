require "pry"
require "colorize"

@amount_won = [5, 10, 20, 50, 100, 500]
@event = [1, 2, 3, 4, 5, 6]



def event_chooser
  rand_event = @event.sample
  case rand_event
  when 1
    event_thirsty
  when 2
    event_lost_chip
  when 3
    event_raffel
  else
    game_menu
  end
end

def player
  puts "\nWelcome to The Casino of The Gods"
  puts "Please enter your name"
  print "> "
  @player = gets.strip
  puts "How much money do you have to play with?"
  @balance = gets.to_i
  sleep(1)
  puts "your balance is now #{@balance}"
  $wallet.start(@balance)
  sleep(1)
  game_menu
end

def game_menu
  puts "Which game would you like to play?"
  puts "1) number_guessing_game"
  puts "2) dice"
  puts "3) How much is in my wallet?"
  puts "4) Quit"
  game = gets.to_i
  case game
  when 1
    number_guessing_game
  when 2
    menu
  when 3
    print_wallet
  when 4
    exit_casino
  else
    game_menu
  end
end

def print_wallet
  puts "Your wallet has $#{$balance}.00 in it."
  game_menu
end

def event_thirsty
  puts "You're thirsty, What drink do you want to buy?"
    drink_choice
    puts "Let's get back to spending your money!"
    game_menu
end

def drink_choice
  puts "1) Soda"
  puts "2) Beer"
  puts "3) Wine"
  puts "4) Cocktail"
  puts "5) Nectar of the Gods"
  drink = gets.to_i
  puts "Excellent Choice!"
  
  case drink
  when 1
    puts "Soda costs $5.00, enjoy!"
    $wallet.lose(5)
  when 2
    puts "Beer costs $10.00, enjoy!"
    $wallet.lose(10)
  when 3
    puts "Wine costs $12.00, enjoy!"
    $wallet.lose(12)
  when 4
    puts "Nice, that'll be $20.00!"
    $wallet.lose(20)
  when 5
    puts "High roller huh? That's $50.00... yummy!"
    $wallet.lose(50)
  else
    puts "invalid entry"
    drink_choice
  end
  
  game_menu
end




def event_lost_chip
  puts "OH NO! While counting your chips you realize you lost a chip!"
  sleep(2)
  chip_lost = @amount_won.sample
  $wallet.lose(chip_lost)
  puts "You lost #{chip_lost}"
  puts "Do you want to check your balance? y/n"
  check_bal= gets.to_s.strip
  check_bal == "y" ? bal_check : game_menu
end

def bal_check
 puts "#{$balance}"
 game_menu
end
 
    

def event_raffel
puts "Congratulations! Your number was just pulled in the Casino of the Gods raffel!"
puts "Wanna see what you won? y/n"
winning_choice = gets.to_s.strip
winning_choice == "y" ? win_menu : game_menu
end

def win_menu
  puts "Let's see what you you've won....."
  sleep(3)
  puts "Wait for it......."
  sleep(2)
  puts "Drum roll please?!"
  sleep(2)
  winnings = @amount_won.sample
  puts "You've won $#{winnings}.00!!"
  $wallet.win(winnings)
  puts "Do you want to check your balance? y/n"
  check_bal= gets.to_s.strip
  check_bal == "y" ? bal_check : game_menu
end


def number_guessing_game
  puts "Welcome to the number guessing game #{@player}"
  sleep(1)
  puts "How much money would you like to bet"
  bet=gets.to_i
  puts "Current balance is #{$wallet.start($balance - bet)}"
  sleep(1)
  number = rand(1..5)
  puts "Pick any number between 1 and 5!"
  winner=false

  while winner==false
    guess=gets.to_i
    sleep(1)
    
    if guess>number then
      puts("Sorry, that number is too high")
      $wallet.lose(bet)
      elsif guess<number then
      puts("Sorry, that number is too low")
      $wallet.lose(bet)
      else
      puts("Congradulations, winner winner chicken dinner!")
      $wallet.win(bet)
        winner=true
        sleep(2)
      end
        puts("Would you like to play again, (y/n)?")
        response = gets.strip
    if response == "y"
      number_guessing_game
      else
      puts "Thank you for playing, I hope you lose more money"
      event_chooser
      
    end
  end
end

def exit_casino
  puts "No? Can't believe it, you're losing so much... why leave?"
  puts "Come back soon!"
  exit
end




class Wallet
  attr_accessor :balance
  
  def initialize
  end

  def start(balance)
    $balance = balance
    return $balance
  end

  def win(amount)
    $balance = $balance + amount
    return $balance
  end

  def lose(amount)
    $balance = $balance - amount
    return $balance
  end

end

$wallet = Wallet.new

      

def menu
  puts "If dice total is 6 or higher you win!!".colorize(:blue)
  puts "Current balance is #{$balance}"
  puts "How much would you like bet?"
  @bet = gets.to_i
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
  wins
end

def wins
  i = @die1 + @die2
  if i >= 6
    space
    sleep(1)
    puts "YOU WON".colorize(:green)
    $wallet.win(@bet)
    play_again
  else
    space
    sleep(1)
    puts "BETTER LUCK NEXT TIME".colorize(:red)
    $wallet.lose(@bet)
    play_again
  end

end
def space 
  puts " " * 5
end

def play_again
  puts "Do you want to play again? y/n?"
  play_choice = gets.to_s.strip
  play_choice == "y" ? menu : event_chooser
end




player