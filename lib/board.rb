# lib/board.rb
class Board
  BOARD_HEIGHT = 6
  BOARD_WIDTH = 7

  attr_accessor :board

  def initialize
    @board = Array.new(BOARD_HEIGHT) { Array.new(BOARD_WIDTH) { "." } }
  end

  def display_board
    board.each { |row| puts row.join(' | ') }
    puts '-------------------------'
    puts '1 | 2 | 3 | 4 | 5 | 6 | 7'
    puts '-------------------------'
    puts ''
  end

  def place_marker(col, player)
    row = BOARD_HEIGHT - 1
    while row >= 0
      if board[row][col] == "."
        board[row][col] = player.mark
        check_line(row, col, player)
        break
      end
      row -= 1
    end
    display_board
  end

  private

  # Check if line is formed
  def check_line(row, col, player)
    line_formed = false
    line_formed = true if horizontal(row, col, player)
    line_formed = true if vertical(row, col, player)
    line_formed = true if diagonal(row, col, player)
    line_formed
  end

  # Horizontal line check
  def horizontal(row, col, player)
    right = h_right(row, col + 1, player)
    left = h_left(row, col - 1, player)
    puts "Player horizontal #{player.mark}: #{right + left + 1}"
    true if right + left >= 4
  end

  def h_right(row, col, player, count = 0)
    return count if board[row][col] != player.mark

    count += 1 if board[row][col] == player.mark || col < 7
    count = h_right(row, col + 1, player, count)
  end

  def h_left(row, col, player, count = 0)
    return count if board[row][col] != player.mark || col < 0

    count += 1 if board[row][col] == player.mark
    count = h_left(row, col - 1, player, count)
  end
  
  # Vertical Line Check
  def vertical(row, col, player)
    down = v_down(row + 1, col, player)
    puts "Player vertical #{player.mark}: #{down + 1}"
    true if down >= 4
  end

  def v_down(row, col, player, count = 0)
    return count if row > 5
    return count if board[row][col] != player.mark

    count += 1 if board[row][col] == player.mark
    count = v_down(row + 1, col, player, count)
  end

  # Diagonal line check
  def diagonal(row, col, player)
    left_to_right = d_left_to_right(row, col, player)
  end
end
