# lib/game.rb

require_relative '../lib/board'
require_relative '../lib/player'
require_relative '../lib/info_module'

# Game class
class Game
  include GameInfo
  attr_accessor :board, :player1, :player2, :switch_player, :rounds

  def initialize
    @board = Board.new
    @player1 = Player.new(1)
    @player2 = Player.new(2)
    @switch = false
    @rounds = 0
    start
  end

  #Starts the game. 
  def start
    game_info
    board.display_board
    play_rounds
  end

  #Plays round until game is won or no of rounds is maxed. 
  def play_rounds
    until game_won? || rounds.eql?(Board::BOARD_HEIGHT * Board::BOARD_WIDTH)
      round
      @switch_player = !switch_player
      @rounds += 1
    end
  end

  #Play each round. 
  def round
    player = current_player
    round_info(player)
    print game_error(:invalid_column) until valid_input(col = gets.chomp.to_i)
    board.place_marker(col - 1, player)
  end

  private

  #Return true if in_range? and col_is_not_full?
  def valid_input(col)
    in_range?(col) && col_is_not_full?(col - 1) ? true : false
  end

  #Return true if user input is in range.
  def in_range?(col)
    col.between?(1, 7)
  end

  #Return true if column is full. 
  def col_is_not_full?(col)
    board.board[0][col].eql?('.') ? true : false
  end

  #Return player1 or 2 
  def current_player
    return player1 unless switch_player

    player2
  end

  #Return true if game is won by forming a line. 
  def game_won?
    false
  end
end
