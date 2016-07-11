require_relative 'player'
require_relative 'game'
require_relative 'cell'

puts "Let's play Ruby-Tac-Toe!"
game = Game.new
player1 = game.player1
player2 = game.player2

current_player = player1

until game.victory? do
  game.display_board 
  valid_input = false

  # Ensure valid input
  until valid_input do
    print "#{current_player} to move >> "
    player_input = gets.chomp
    
    if player_input == "exit" || player_input == "q" 
      puts "Leaving game...!"
      Kernel.exit(true)
    end

    valid_input = Player.verify_input(player_input)
    puts "Invalid command! Specify the coordinates on the grid!" if !valid_input
  end

  player_move = current_player.play(player_input)
  game.make_moves(player_move)

  # End-state messages
  if game.victory?
    game.display_board
    puts "Congratulations! #{current_player} wins!" 
  end

  if game.draw?
    game.display_board
    puts "...Draw! Thanks for playing!"
    Kernel.exit(true)
  end

  # Switch the players after loop
  if current_player.side == player1.side
    current_player = player2
  else
    current_player = player1
  end
end