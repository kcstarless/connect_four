require_relative 'lib/board'

puts "Let's play connect 4!"

board = Board.new
board.display_board
board.place_marker(4, "\u25CF")
board.display_board
