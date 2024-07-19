using Rainbow

class Game
    def initialize
        # @board = Array.new(4, {turn: ;values: []}) make turn a new object. Can have Turn number increase globally, rest locally
            # perhaps each turn creates a new array and pushes it into this? Yes, can have a turns left counter as well
        $choices = ['r', 'g', 'b', 'y', 'm', 'c', 'g', 'w']
        @choices_colored = ['r'.color(:red), 'g'.color(:green), 'b'.color(:blue), 'y'.color(:yellow), 'm'.color(:magenta), 'c'.color(:cyan), 'g'.color(:black), 'w'.color(:white)]
        @turn = 2
    end
    def color_text(string)
      string.map
    end
    def play
        @code_maker = CodeMaker.new
        code_breaker = CodeBreaker.new
        p "Please guess the 4-character code with the following choices:"
        puts "#{@choices_colored.join(', ')}"
        while @turn > 0 do
            code_breaker.make_guess
            # p @code_maker.code
            @code_maker.has_won?(code_breaker.guess) ? winner && return : @code_maker.give_feedback(code_breaker.guess)
            @turn -= 1
            p "Guesses remaining: #{@turn}"
        end
        loser
    end
    def winner
        p "You win! The code was '#{@code_maker.code_colored.join('')}'"
    end
    def loser
        puts "You lose! The code was '#{@code_maker.code_colored.join('')}'".red
    end
end