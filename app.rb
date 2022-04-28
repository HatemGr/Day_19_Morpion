require 'bundler'
Bundler.require

$:.unshift File.expand_path("./../lib", __FILE__)
require 'app/game'
require 'app/player'
require 'views/board_case'
require 'views/board'
require 'views/header'

player_1 = Player.new("Pierre","X")
player_2 = Player.new("Jean","O")
mygame = Game.new(player_1,player_2)

until mygame.round_number == 10 || check_win
  mygame.display_board
  mygame.player_move(player_1)
  mygame.display_board
  mygame.next_round == 10 ? next : true
  mygame.player_move(player_2)
  mygame.next_round
  mygame.display_board
end
