using Rainbow

class Game
    def initialize
        @board = []
        $choices = ['r', 'g', 'b', 'y', 'p', 'c', 'd', 'w']
        @choices_colored = ['r'.color(:red), 'g'.color(:green), 'b'.color(:blue), 'y'.color(:yellow), 'p'.color(:magenta), 'c'.color(:cyan), 'd'.color(:black), 'w'.color(:white)]
        @turn = 6
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
        puts "You win! The code was '#{@code_maker.code_colored.join('')}'"
    end
    def loser
        puts "You lose! The code was '#{@code_maker.code_colored.join('')}'"
    end
end