
@amount_won = [5, 10, 20, 50, 100, 500]

require "pry"

$balance = nil

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
  end

  def lose(amount)
    $balance = $balance - amount
  end

end

$wallet = Wallet.new
  
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

end




def event_lost_chip
  puts "OH NO! While counting your chips you realize you lost a chip!"
  puts "Do you want to check your balance? y/n"
  check_bal = gets.to_s.strip
  check_bal == "y" ? print_balance : game_menu
end

def even_raffel
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
  puts "You've won $#{winnings}00!!"
  @Wallet.win(winnings)
end

