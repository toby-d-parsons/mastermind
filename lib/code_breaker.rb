class CodeBreaker
    attr_reader :guess, :guess_colored
    include ColorInputManager
    def initialize
    end
    def make_guess
        input = gets.chomp.split('')
        is_valid?(input) ? @guess = input : (p 'Invalid entry. Please enter a valid entry') && make_guess && return
        @guess_colored = ColorInputManager.colorize_text(@guess)
    end
    def is_valid?(arr)
        arr.length == 4 &&
        arr.all? do |val|
            valid_color_abbrv = COLOR_KEYS.map { |x| x.to_s[0].chars.first }
            valid_color_abbrv.any? { |arr| arr == val}
        end
    end
end