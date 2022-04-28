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