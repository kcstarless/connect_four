# lib/board.rb
class Board
  BOARD_ROW = 6
  BOARD_COL = 7
  WINNING_LINE = 4

  attr_accessor :board, :line_formed

  def initialize
    @board = Array.new(BOARD_ROW) { Array.new(BOARD_COL) { "." } }
    @line_formed = false
  end

  def display_board
    board.each { |row| puts row.join(' | ') }
    puts '-------------------------'
    puts '1 | 2 | 3 | 4 | 5 | 6 | 7'
    puts '-------------------------'
    puts ''
  end

  def place_marker(col, player)
    row = BOARD_ROW - 1
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

  # Check if line is formed.
  def check_line(row, col, player)
    @line_formed = true if horizontal(row, col, player) || vertical(row, col, player) || diagonal(row, col, player)
  end

  # Horizontal line check.
  def horizontal(row, col, player)
    true if h_right(row, col + 1, player) + h_left(row, col - 1, player) + 1 >= WINNING_LINE
  end

  # ----- Check right horizontal line.
  def h_right(row, col, player, count = 0)
    return count if exit_condition(row, col, player)

    h_right(row, col + 1, player, count + 1)
  end

  # ----- Check left horizontal line.
  def h_left(row, col, player, count = 0)
    return count if exit_condition(row, col, player)

    h_left(row, col - 1, player, count + 1)
  end

  # Vertical Line Check.
  def vertical(row, col, player)
    true if v_down(row + 1, col, player) + 1 >= WINNING_LINE
  end

  # ----- Check vertical line downwards only.
  def v_down(row, col, player, count = 0)
    return count if exit_condition(row, col, player)

    v_down(row + 1, col, player, count + 1)
  end

  # Diagonal line check.
  def diagonal(row, col, player)
    left_to_right = left_top(row - 1, col - 1, player) + right_bottom(row + 1, col + 1, player) + 1
    right_to_left = right_top(row - 1, col + 1, player) + left_bottom(row + 1, col - 1, player) + 1
    true if left_to_right >= Board::WINNING_LINE || right_to_left >= Board::WINNING_LINE
  end

  # ----- Check left top.
  def left_top(row, col, player, count = 0)
    return count if exit_condition(row, col, player)

    left_top(row - 1, col - 1, player, count + 1)
  end

  # ----- Check right bottom.
  def right_bottom(row, col, player, count = 0)
    return count if exit_condition(row, col, player)

    right_bottom(row + 1, col + 1, player, count + 1)
  end

  # ----- Check right top.
  def right_top(row, col, player, count = 0)
    return count if exit_condition(row, col, player)

    right_top(row - 1, col + 1, player, count + 1)
  end

  # ----- Check left bottom.
  def left_bottom(row, col, player, count = 0)
    return count if exit_condition(row, col, player)

    left_bottom(row + 1, col - 1, player, count + 1)
  end

  # Check for exit conditions.
  def exit_condition(row, col, player)
    return true if col < 0 || row > Board::BOARD_ROW - 1 || col > Board::BOARD_COL - 1 || row < 0

    return true if board[row][col] != player.mark || board[row][col] == '.'

    false
  end
end
