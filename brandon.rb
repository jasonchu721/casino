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
  