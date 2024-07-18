class CodeBreaker
    attr_reader :guess
    def initialize
        # @turn = $turn
        # @likeness = 'Match: #{@total_matches} Wrong Position: #{@total_matches_wrong_pos}'
    end
    def make_guess
        input = gets.chomp.split('')
        is_valid?(input) ? @guess = input : make_guess && return
        # @turns_remaining -= 1
    end
    def is_valid?(arr)
        arr.length == 4 &&
        arr.all? do |val|
            valid_color_abbrv = $choices.map { |x| x.to_s[0] }
            valid_color_abbrv.any? { |arr| arr == val}
        end
    end
end

# How to get game and turn to link? Where is the line drawn in terms of what goes where? Likely need to rejig some of this