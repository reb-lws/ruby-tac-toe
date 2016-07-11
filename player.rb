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

  def self.verify_input(s)
    return false if s.size != 2
    split = s.split("")

    acceptable_row_letter = ["A", "B", "C", "a", "b", "c"].include?(split.first)
    acceptable_col_num = [1, 2, 3].include?(split.last.to_i)

    if !acceptable_row_letter || !acceptable_col_num
      false
    else
      true
    end
  end

  def inspect
    "Player #{@side}"
  end

  def to_s
    "Player #{@side}"
  end
  
end