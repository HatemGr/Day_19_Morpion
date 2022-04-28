require 'bundler'
Bundler.require

$:.unshift File.expand_path("./../lib", __FILE__)
require 'app/game'
require 'app/player'
require 'views/board_case'
require 'views/board'
require 'views/header'

mygame = Game.new()

until mygame.round_number == 9 || mygame.check_win
  mygame.player_switch
  mygame.display_board
  mygame.player_move
  mygame.display_board
  mygame.next_round
end

puts "C'est fini !!! #{mygame.player_on.name} a gagné"
