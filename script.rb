class Player
  attr_reader :name, :marker

  def initialize(player_number)
    build_player(player_number)
  end

  private

  def build_player(number)
    puts "Player #{number}, what is your name?"
    @name = gets.chomp
    puts "#{name}, what would you like to use as your marker?"
    @marker = gets.chomp
  end

  public

  def play
    number = gets.chomp.to_i - 1
    loop do
      break if number.is_a? Integer

      puts 'Not a tile on this board, try again.'
      number = gets.chomp.to_i - 1
    end
    number
  end
end

class Game
  attr_accessor :winner, :winning_player, :board
  attr_reader :player1, :player2

  def initialize
    @winning_player = ''
    @winner = false
    @player1 = Player.new(1)
    @player2 = Player.new(2)
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

  def reset
    @board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    self.winner = false
    @bool_array = [false, false, false,
                   false, false, false,
                   false, false, false]
  end

  def play_game
    print_board
    while winner == false
      choose(player1)
      print_board
      winner?
      if winner == true
        self.winning_player = @player1.name
        break
      end
      choose(player2)
      print_board
      winner?
      self.winning_player = @player2.name if winner == true
    end
    game_end
  end

  def game_end
    puts "Nice victory, #{@winning_player}..."
    puts 'Play again? (Y/N)'
    choice = gets.chomp.downcase
    if choice == 'y'
      reset
      play_game
    else
      puts 'Bye, thanks for playing.'
    end
  end

  def choose(player)
    puts "#{player.name}, choose your next move from an available tile."
    choice = player.play
    loop do
      if choice.negative? || choice > 8
        puts 'Not a tile on this board, try again.'
      elsif @bool_array[choice]
        puts 'Tile taken, please try again.'
      else break
      end
      choice = player.play
    end
    @board[choice] = player.marker
    @bool_array[choice] = true
  end

  def winner?
    check_horizontal
    check_vertical
    check_diagonal
  end

  def check_horizontal
    for i in [1,4,7]
      if board[i - 1] == board[i] && board[i] == board[i + 1]
        self.winner = true
        break
      end
    end
  end

  def check_vertical
    for i in [3,4,5]
      if board[i - 3] == board[i] && board[i] == board[i + 3]
        self.winner = true
        break
      end
    end
  end

  def check_diagonal
    for i in [2,4]
      if board[4 - i] == board[4] && board[4] == board[4 + i]
        self.winner = true
        break
      end
    end
  end
end

game = Game.new

game.play_game