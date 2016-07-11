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
    cell_to_change = translate_coordinates(coordinates_string)
    cell_to_change.take_side(moving_player)
    puts "#{moving_player} moves to #{coordinates_string[0] + coordinates_string[1]}."
  end

  # Returns true if there is a winner on the board. False if no one has won yet.
  def victory?
    return row_victory? || diagonal_victory? || column_victory?
  end

  # Returns true if there is a draw on the board.
  def draw?
    flattened_board = @board.flatten
    flattened_board.include?(nil) ? false : true
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

  # Translates coordinates into a specific Cell reference.
  # ROW-LETTER + COLUMN-NUM -> [row_index, col_index]; e.g. 'A3' -> [0, 2]
  def translate_coordinates(coordinates)
    coordinates_ary = coordinates.split("")
    # Convert row letter into index
    letter = coordinates_ary[0].upcase
    coordinates_ary[0] = @@ROW_HASH[letter]
    row_index = coordinates_ary[0]
    column_index = coordinates_ary[1].to_i - 1 # -1 because indices start at 0
    return @board[row_index][column_index]
  end

  def row_victory?
    @board.each do |row|
      sides_ary = row.collect { |cell| cell.side }
      next if sides_ary.include?(nil)
      return true if sides_ary.uniq.size <= 1
    end

    return false
  end

  def column_victory?
    # Each loop checks a column
    3.times do |index|
      sides_to_inspect = []
      # sides_to_inspect collects by the column
      @board.each do |row|
        sides_to_inspect << row[index].side
      end
      
      if sides_to_inspect.include?(nil)
        next
      elsif sides_to_inspect.uniq.size <= 1
        return true
      end
    end

    return false
  end


  def diagonal_victory?
    winning_side = translate_coordinates("B2").side
    unless winning_side.nil?
      a1 = translate_coordinates("A1")
      c3 = translate_coordinates("C3")
      a3 = translate_coordinates("A3")
      c1 = translate_coordinates("C1")

      if winning_side == a1.side && a1.side == c3.side
        true
      elsif winning_side == a3.side && a3.side == c1.side
        true
      else
        false
      end
    else
      false
    end
  end



end