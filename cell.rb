# This class represents the cells on the gameboard.
class Cell
  attr_accessor :side

  def initialize
    @side = nil
  end 

  # This class takes in a Player's side as a parameter,
  # and sets the cell to that player's side.
  def take_side(player)
    @side = player.side unless self.occupied?
  end

  def occupied?
    @side.nil? ? false : true
  end

  def to_s
    if @side.nil?
      "_"
    else
      @side
    end
  end

  def inspect
    "Cell" + to_s
  end
end