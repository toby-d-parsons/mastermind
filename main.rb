require 'pry-byebug'
require 'rainbow/refinement'
require_relative 'lib/game.rb'
require_relative 'lib/code_breaker.rb'
require_relative 'lib/code_maker.rb'
require_relative 'lib/color_input_manager.rb'

game = Game.new

game.play