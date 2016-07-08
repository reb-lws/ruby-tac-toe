# This class contains the state of the game board and references to other players.
class Game
  @@ROW_HASH = {"A" => 0, "B" => 1, "C" => 2}
  attr_reader :player1, :player2
  attr_accessor :board

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
    puts "   1   2    3"
    puts "A  " + " #{row1[0]} # #{row1[1]} # #{row1[2]}  "
    puts "   ###########"
    puts "B  " + " #{row2[0]} # #{row2[1]} # #{row2[2]}  "
    puts "   ###########"
    puts "C  " + " #{row3[0]} # #{row3[1]} # #{row3[2]}  "
  end

  def inspect
    "TicTacToeGame"
  end

  # Update the gameboard according to the specifications provided by play_ary.
  def make_moves(play_ary)
    moving_player = play_ary[0]
    coordinates_string = play_ary[1]
    coordinates = translate_coordinates(coordinates_string)
    row = coordinates[0]
    column = coordinates[1]
    puts "#{moving_player} takes #{coordinates_string[0] + coordinates_string[1]}."
    
    modify_board!(column, row, moving_player)
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

  def modify_board!(column, row, player)
    @board[column][row].side = player.side
    puts @board[column][row]
  end

  # Translates coordinates into a specific Cell reference.
  # ROW-LETTER + COLUMN-NUM -> [row_index, col_index]; e.g. 'A3' -> [0, 2]
  def translate_coordinates(coordinates)
    coordinates_ary = coordinates.split("")
    # Convert row letter into index
    letter = coordinates_ary[0]
    coordinates_ary[0] = @@ROW_HASH[letter]
    column_index = coordinates_ary[0]
    row_index = coordinates_ary[1].to_i - 1 # -1 because indices start at 0
    return [row_index, column_index]
  end


end

# This class represents the cells on the gameboard.
class Cell
  attr_accessor :side

  def initialize
    @side = nil
  end 

  # This class takes in a Player's side as a parameter,
  # and sets the cell to that player's side.
  def take_side(player)
    @side = player.side
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

game = Game.new
puts game
player1 = game.player1
player2 = game.player2

game.make_moves(player1.play("A1"))
game.make_moves(player2.play("C3"))
puts game

