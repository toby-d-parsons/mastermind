class Game
    def initialize
        # @board = Array.new(4, '-')
            # perhaps each turn creates a new array and pushes it into this? Yes, can have a turns left counter as well
        # @turns = 6
            # In future, allow initialize to set the number of turns for the game?
        @code = [get_random_color, get_random_color, get_random_color, get_random_color]
    end
    def get_random_color
        choices = ['red', 'green', 'blue', 'yellow', 'orange', 'pink', 'grey', 'white']
        choices.sample
    end
end