# lib/player.rb

# player class
class Player
  attr_reader :mark

  def initialize(player)
    @mark = pick_mark(player)
  end

  def pick_mark(player)
    player == 1 ? "\u25CF" : "\u25CB"
  end
end
