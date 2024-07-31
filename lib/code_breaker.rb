class CodeBreaker
    attr_reader :guess, :guess_colored
    include ColorInputManager, InputValidator
    def initialize(player_role)
      @player_role = player_role
    end
    def make_guess
      if @player_role == "code_breaker"
        input = gets.chomp.split('')
        InputValidator.is_valid?(input) ? @guess = input : (p 'Invalid entry. Please enter a valid entry') && make_guess && return
        @guess_colored = ColorInputManager.colorize_text(@guess)
      else
        sleep(0.5)
        @guess = [get_random_color, get_random_color, get_random_color, get_random_color]
        @guess_colored = ColorInputManager.colorize_text(@guess)
      end
    end
    # def make_guess
    #     input = gets.chomp.split('')
    #     InputValidator.is_valid?(input) ? @guess = input : (p 'Invalid entry. Please enter a valid entry') && make_guess && return
    #     @guess_colored = ColorInputManager.colorize_text(@guess)
    # end
    def get_random_color
        COLOR_KEYS.sample
    end
    # def is_valid?(arr)
    #     arr.length == 4 &&
    #     arr.all? do |val|
    #         valid_color_abbrv = COLOR_KEYS.map { |x| x.to_s[0].chars.first }
    #         valid_color_abbrv.any? { |arr| arr == val}
    #     end
    # end
end