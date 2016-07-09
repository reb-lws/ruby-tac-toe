# This class represents the game player, who sends moves to the gameboard.
class Player
  attr_reader :side

  def initialize(side)
    @side = side
  end

  # Take in the user-specified coordinates and return an array containing
  # the self reference and player coordinates. Takes in coordinates from
  # string form: ROW-LETTER + COLUMN-NUMBER
  def play(coordinates)
    to_play = [self, coordinates]
  end

  def inspect
    "Player: #{@side}"
  end

  def to_s
    "Player #{@side}"
  end
  
end