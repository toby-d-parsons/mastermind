require_relative './color_input_manager.rb'
using Rainbow

class Game
    include ColorInputManager
    def initialize
        @board = []
        @turn = 6
    end
    def play
        @code_maker = CodeMaker.new
        code_breaker = CodeBreaker.new
        p "Please guess the 4-character code with the following choices:"
        puts "#{COLOR_KEYS_FORMATTED.join(', ')}"
        while @turn > 0 do
            code_breaker.make_guess
            if @code_maker.has_won?(code_breaker.guess)
                winner
                return
            else
                @code_maker.give_feedback(code_breaker.guess)
            end
            @turn -= 1
            @board.push([
                code_breaker.guess_colored,
                " Exact: #{@code_maker.exact}",
                " Close: #{@code_maker.close}"
            ].join(''))
            puts @board
            p "Guesses remaining: #{@turn}"
        end
        loser
    end
    def winner
        puts "You win! The code was '#{@code_maker.CODE_COLORED.join('')}'"
    end
    def loser
        puts "You lose! The code was '#{@code_maker.CODE_COLORED.join('')}'"
    end
end