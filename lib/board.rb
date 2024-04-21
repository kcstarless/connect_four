# lib/board.rb
class Board
  BOARD_HEIGHT = 6
  BOARD_WIDTH = 7

  attr_accessor :board

  def initialize
    @board = Array.new(BOARD_HEIGHT) { Array.new(BOARD_WIDTH) { "\u25E6" } }
  end

  def display_board
    board.each { |row| puts row.join(' | ') }
    puts '-------------------------'
    puts '1 | 2 | 3 | 4 | 5 | 6 | 7'
  end

  def place_marker(col, player)
    h = Board::BOARD_HEIGHT - 1
    while h >= 0
      if board[h][col] == "\u25E6"
        board[h][col] = player
        break
      end
      h -= 1
    end
  end
end
# new_board = Board.new
