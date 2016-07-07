# This class contains the state of the game board and references to other players.
class Game
  @@ROW_HASH = {"A" => 0, "B" => 1, "C" => 2}
  attr_reader :player1, :player2

  def initialize
    @board = create_board
    @player1 = Player.new("X")
    @player2 = Player.new("O")
  end

  def to_s
    # Need to find a better way to represent the board
    row1 = @board[0]
    row2 = @board[1]
    row3 = @board[2]
    puts "   A   B    C"
    puts "1  " + " #{row1[0]} # #{row1[1]} # #{row1[2]}  "
    puts "   ###########"
    puts "2  " + " #{row2[0]} # #{row2[1]} # #{row2[2]}  "
    puts "   ###########"
    puts "3  " + " #{row3[0]} # #{row3[1]} # #{row3[2]}  "
  end

  def inspect
    "TicTacToe"
  end

  
  private
  # Creates the initial gameboard.
  def create_board
    board_ary = []
    # Loop and create a 3x3 gameboard
    3.times do 
      row = []
      3.times do
        row << Cell.new
      end
      board_ary << row
    end
    board_ary
  end

end

# This class represents the cells on the gameboard.
class Cell
  attr_reader :side

  def initialize
    @side = nil
  end

  # This class takes in a Player's side as a parameter,
  # and sets the cell to that player's side.
  def set_side(player)
    if @side.nil?
      @side = player.side
    else
      puts "Cell is already an #{@side}!"
    end
  end

  def to_s
    @side unless @side.nil?
    return "_"
  end

  def inspect
    "Cell: " + to_s
  end
end

# This class represents the game player, who sends moves to the gameboard.
class Player
  attr_reader :side

  def initialize(side)
    @side = side
  end

  # Return the coordinates the player wishes to play on.
  # def play(coordinates); end

end

new_game = Game.new
puts new_game