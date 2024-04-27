# lib/info_module

# Game information module
module GameInfo
  def game_error(error_type)
    {
      invalid_column: "Please enter a column that is not full and between 1 to 7: ",
      column_full: "Column is full choose another column."

    }[error_type]
  end

  def game_info
    puts "Let's play connect 4!"
    puts "Where two players compete to connect 4 tokens!"
    puts ""
    puts "Player 1: " + player1.mark + "  " + "Player 2: " + player2.mark
    puts ""
  end

  def round_info(player)
    print "Player #{player.mark} choose a column(1-7): "
  end
end
