class Player
  attr_accessor :name, :marker

  def initialize(name, marker)
    @name = name
    @marker = marker
  end

  def play
    # puts "#{name}, please choose an available tile from this board."
    # number = gets.chomp.to_i - 1
    # loop do
    #   if number.is_a? Integer
    #     break
    #   elsif number.negative? || number > 8
    #     'Not a tile on this board, try again.'
    #   else 'Not a tile on this board, try again.'
    #   end
    #   number = gets.chomp.to_i
    # end
    # number
    number = gets.chomp.to_i - 1
    loop do
      if number.is_a? Integer
        break
      else
        'Not a tile on this board, try again.'
      end

      number = gets.chomp.to_i - 1
    end
    number
  end
end

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
    puts '----------'
    puts "#{board[3]} | #{board[4]} | #{board[5]}"
    puts '----------'
    puts "#{board[6]} | #{board[7]} | #{board[8]}"
  end

  def winner?; end

  def play_game
    winner = false
    while winner == false
      # player1_play
      choose(@player1)
      print_board
      # player2_play
      choose(@player2)
      print_board
    end
  end

  # def player1_play
  #   puts "#{player1}, choose your next move from an available tile."
  #   choice = gets.chomp.to_i - 1
  #   loop do
  #     if choice < 0 || choice > 8
  #       puts 'Not a tile on this board, please try again.'
  #     # elsif choice < 1 && choice > 9
  #     #   puts 'Not a tile on this board, please try again.'
  #     elsif @bool_array[choice] == true
  #       puts 'Tile taken, please try again.'
  #     else
  #       break
  #     end
  #     choice = gets.chomp.to_i - 1
  #   end
  #   @board[choice] = 'X'
  #   @bool_array[choice] = true
  # end

  # def player2_play
  #   puts "#{player2}, choose your next move from an available tile."
  #   choice = gets.chomp.to_i - 1
  #   @board[choice] = 'O'
  #   @bool_array[choice] = true
  # end

  def choose(player)
    puts "#{player.name}, choose your next move from an available tile."
    choice = player.play
    loop do
      if choice.negative? || choice > 8
        puts 'Not a tile on this board, try again.'
      elsif @bool_array[choice] == true
        puts 'Tile taken, please try again.'
      else break
      end

      choice = player.play
    end
    @board[choice] = player.marker
    @bool_array[choice] = true
  end
end

puts 'Player 1, what is your name?'
name1 = gets.chomp
puts "#{name1}, what would you like your symbol to be?"
marker1 = gets.chomp
player1 = Player.new(name1, marker1)

puts 'Player 2, what is your name?'
name2 = gets.chomp
puts "#{name2}, what would you like your symbol to be?"
marker2 = gets.chomp
player2 = Player.new(name2, marker2)

game = Game.new(player1, player2)

game.print_board
game.play_game
