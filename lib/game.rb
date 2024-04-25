# lib/game.rb

require_relative '../lib/board'
require_relative '../lib/player'
require_relative '../lib/info_module'

# Game class
class Game
  include GameInfo
  attr_accessor :board, :player1, :player2, :switch_player

  def initialize
    @board = Board.new
    @player1 = Player.new(1)
    @player2 = Player.new(2)
    @switch = false
    @rounds = 0
    start
  end

  def start
    game_info
    board.display_board
    play_rounds
  end

  def play_rounds
    until game_won?
      round
      @switch_player = !switch_player
    end
  end

  def round
    player = current_player
    round_info(player)
    col = valid_input(gets.chomp.to_i)
    puts col
  end

  private

  def valid_input(input)
    if input.between?(1, 7)
      input
    else
      puts 'invalid input'
      round
    end
  end

  def current_player
    return player1 unless switch_player

    player2
  end

  def game_won?
    false
  end
end
