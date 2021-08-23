# class Player
#   attr_accessor :name
# end

class Game
  attr_accessor :board
  attr_reader :player1, :player2

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    @bool_array = [false, false, false,
                   false, false, false,
                   false, false, false]
  end

  def print_board
    puts "#{board[0]} | #{board[1]} | #{board[2]}"
    puts "----------"
    puts "#{board[3]} | #{board[4]} | #{board[5]}"
    puts "----------"
    puts "#{board[6]} | #{board[7]} | #{board[8]}"
  end

  def winner?

  end

  def play_game
    winner = false
    while winner == false
      player1_play
      print_board
      player2_play
      print_board
    end
  end

  def player1_play
    puts "#{player1}, choose your next move from an available tile."
    choice = gets.chomp.to_i - 1
    @board[choice] = 'X'
    @bool_array[choice] = true
  end

  def player2_play
    puts "#{player2}, choose your next move from an available tile."
    choice = gets.chomp.to_i - 1
    @board[choice] = 'O'
    @bool_array[choice] = true
  end

end

puts 'Player 1, what is your name?'
player1 = gets.chomp

puts 'Player 2, what is your name?'
player2 = gets.chomp

game = Game.new(player1, player2)

game.print_board
game.play_game
