class CodeBreaker
    attr_reader :guess, :guess_colored
    def initialize
    end
    def make_guess
        input = gets.chomp.split('')
        is_valid?(input) ? @guess = input : (p 'Invalid entry. Please enter a valid entry') && make_guess && return
        @guess_colored = @guess.map do |color|
            case color
            when 'r'
              "\e[31mr\e[0m"
            when 'g'
              "\e[32mg\e[0m"
            when 'b'
              "\e[34mb\e[0m"
            when 'y'
              "\e[33my\e[0m"
            when 'p'
              "\e[35mp\e[0m"
            when 'c'
              "\e[36mc\e[0m"
            when 'd'
              "\e[30md\e[0m"
            when 'w'
              "\e[37mw\e[0m"
            end
          end
    end
    def is_valid?(arr)
        arr.length == 4 &&
        arr.all? do |val|
            valid_color_abbrv = $choices.map { |x| x.to_s[0].chars.first }
            valid_color_abbrv.any? { |arr| arr == val}
        end
    end
end