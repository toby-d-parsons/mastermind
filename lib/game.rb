class Game
    def initialize
        # @board = Array.new(4, '-')
            # perhaps each turn creates a new array and pushes it into this? Yes, can have a turns left counter as well
        @turns_remaining = 6
            # In future, allow initialize to set the number of turns for the game?
        @code = [get_random_color, get_random_color, get_random_color, get_random_color]
    end
    def turn
        input = gets.chomp.split('')
        is_valid?(input) ? true : turn && return
        @turns_remaining -= 1
    end
    def is_valid?(input_arr)
        input_arr.length == 4 &&
        input_arr.all? do |val|
            valid_color_abbrv = @choices.map { |x| x.to_s[0] }
            valid_color_abbrv.any? { |arr| arr == val}
        end
    end
    def get_random_color
        @choices = ['red', 'green', 'blue', 'yellow', 'orange', 'pink', 'grey', 'white']
        @choices.sample
    end
end