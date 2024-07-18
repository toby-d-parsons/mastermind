require 'pry-byebug'
require_relative 'lib/game.rb'
require_relative 'lib/code_breaker.rb'
require_relative 'lib/code_maker.rb'

game = Game.new
code_maker = CodeMaker.new
code_breaker = CodeBreaker.new

code_breaker.make_guess
p 'CodeMaker code:'
p code_maker.code
p 'CodeBreaker guess:'
p code_breaker.guess
code_maker.give_feedback(code_breaker.guess)

# game.turn

# binding.pry

#p game