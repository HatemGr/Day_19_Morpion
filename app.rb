require 'bundler'
Bundler.require

$:.unshift File.expand_path("./../lib", __FILE__)
require 'app/game'
require 'app/player'
require 'views/board_case'
require 'views/board'
require 'views/header'

#Board.new().display_board
myplayer = Player.new("Paul")
myplayer.choose_case("A")
