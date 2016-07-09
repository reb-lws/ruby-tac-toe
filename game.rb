# This class contains the state of the game board and references to other players.
class Game
  @@ROW_HASH = {"A" => 0, "B" => 1, "C" => 2}
  attr_reader :player1, :player2, :board

  def initialize
    @board = create_board
    @player1 = Player.new("X")
    @player2 = Player.new("O")
  end

  # Print out a string representation of the gameboard
  def display_board
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