require_relative 'player'
require_relative 'game'
require_relative 'cell'

puts "Let's play Ruby-Tac-Toe!"
game = Game.new
player1 = game.player1
player2 = game.player2




=begin lame debugging
game = Game.new
game.display_board
player1 = game.player1
player2 = game.player2

game.make_moves(player1.play("A3"))
game.make_moves(player1.play("B2"))
game.make_moves(player1.play("C1"))

p game.victory?

game.display_board
=end