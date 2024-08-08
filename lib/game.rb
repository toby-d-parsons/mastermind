require_relative './color_input_manager.rb'
require_relative './input_validator.rb'
require_relative 'mastermind_checker'
using Rainbow

class Game
    include ColorInputManager
    def initialize
        @board = ["#{COLOR_KEYS_FORMATTED.join(', ')}"]
        @initial_turn = 6
        @turn = @initial_turn
    end
    def play
        puts "Select \e[92mcode_breaker\e[0m or \e[92mcode_maker\e[0m"
        player_role = player_role_chooser
        @code_maker = CodeMaker.new(player_role)
        code_breaker = CodeBreaker.new(player_role)
        if player_role == "code_breaker"
          p "Please guess the 4-character code with the following choices:"
          puts "#{COLOR_KEYS_FORMATTED.join(', ')}"
        end
        while @turn > 0 do
            code_breaker.make_guess(@initial_turn, @turn)
            if @code_maker.has_won?(code_breaker.guess)
                winner
                return
            else
                arr_exact_close = MastermindChecker.check_matches(code_breaker.guess, @code_maker.CODE)
                code_breaker.remove_incorrect_combs(arr_exact_close)
            end
            @turn -= 1
            @board.push([
                code_breaker.guess_colored,
                " Exact: #{arr_exact_close[0]}",
                " Close: #{arr_exact_close[1]}"
            ].join(''))
            puts @board
            p "Guesses remaining: #{@turn}"
        end
        loser
    end
    def player_role_chooser
      choice = gets.chomp
      if (choice == "code_maker" || choice == "code_breaker")
        choice
      else
        puts "Please select either \e[92mcode_breaker\e[0m or \e[92mcode_maker\e[0m"
        player_role_chooser
        return
      end
    end
    def winner
        puts "The code breaker win! The code was '#{@code_maker.CODE_COLORED.join('')}'"
    end
    def loser
        puts "The code breaker loses! The code was '#{@code_maker.CODE_COLORED.join('')}'"
    end
end