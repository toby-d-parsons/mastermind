class CodeBreaker
    attr_reader :guess
    def initialize
    end
    def make_guess
        input = gets.chomp.split('')
        is_valid?(input) ? @guess = input : (p 'Invalid entry. Please enter a valid entry') && make_guess && return
    end
    def is_valid?(arr)
        arr.length == 4 &&
        arr.all? do |val|
            valid_color_abbrv = $choices.map { |x| x.to_s[0] }
            valid_color_abbrv.any? { |arr| arr == val}
        end
    end
end