require_relative 'player'
require_relative 'game'
require_relative 'cell'


game = Game.new
game.display_board
player1 = game.player1
player2 = game.player2

game.make_moves(player1.play("A1"))
game.make_moves(player2.play("C3"))
game.display_board

game.make_moves(player2.play("A1"))
p game.victory?
