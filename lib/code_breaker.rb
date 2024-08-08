class CodeBreaker
    attr_reader :guess, :guess_colored
    include ColorInputManager, InputValidator, MastermindChecker
    def initialize(player_role)
      @player_role = player_role
      generate_combinations
    end
    def make_guess(initial_turn, turn)
      if @player_role == "code_breaker"
        input = gets.chomp.split('')
        InputValidator.is_valid?(input) ? @guess = input : (p 'Invalid entry. Please enter a valid entry') && make_guess(initial_turn, turn) && return
        @guess_colored = ColorInputManager.colorize_text(@guess)
      elsif turn == initial_turn
        @guess = [COLOR_KEYS[0], COLOR_KEYS[0], COLOR_KEYS[1], COLOR_KEYS[1]]
        @guess_colored = ColorInputManager.colorize_text(@guess)
        sleep(0.5)
      else
        @guess = @arr.sample
        @guess_colored = ColorInputManager.colorize_text(@guess)
        sleep(0.5)
      end
    end

    def get_random_color
        COLOR_KEYS.sample
    end
    
    def generate_combinations
      @arr = COLOR_KEYS.repeated_permutation(4).to_a
    end

    def remove_incorrect_combs(guess_feedback)
      @arr.delete(@guess) # Removes guess from pool
      @arr = @arr.select do |item|
        keep_combination?(guess_feedback, MastermindChecker.check_matches(item, @guess))
      end
    end

    def keep_combination?(guess_feedback, potential_feedback)
      guess_feedback === potential_feedback
    end
end