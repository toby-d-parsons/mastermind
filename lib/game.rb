class Game
    def initialize
        # @board = Array.new(4, {turn: ;values: []}) make turn a new object. Can have Turn number increase globally, rest locally
            # perhaps each turn creates a new array and pushes it into this? Yes, can have a turns left counter as well
        #@turns_remaining = 6
            # In future, allow initialize to set the number of turns for the game?
        #@code = [get_random_color, get_random_color, get_random_color, get_random_color]
        $choices = ['r', 'g', 'b', 'y', 'o', 'p', 'v', 'w'] #['red', 'green', 'blue', 'yellow', 'orange', 'pink', 'violet', 'white']
    end
end