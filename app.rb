require 'bundler'
require 'colorize'
Bundler.require

$:.unshift File.expand_path("./../lib", __FILE__)
require 'app/game'
require 'app/player'
require 'views/board_case'
require 'views/board'
require 'views/header'

mygame = Game.new()
mygame.perform

# while mygame.game_on
#   mygame.game_reset
#   until mygame.round_number == 10 || mygame.check_win
#     system("clear")
#     mygame.player_switch
#     mygame.display_header
#     mygame.display_board
#     mygame.player_move
#     mygame.next_round
#   end
#   mygame.display_header
#   mygame.display_board
#   mygame.end_game
#   mygame.rematch?
# end