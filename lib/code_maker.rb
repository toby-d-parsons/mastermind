class CodeMaker
  attr_reader :code
  def initialize
    @code = [get_random_color, get_random_color, get_random_color, get_random_color]
  end
  def get_random_color
    $choices.sample
  end
  def has_won?(guess)
    guess === @code
  end
  def give_feedback(guess)
    exact = 0
    close = 0
    guess_rem = []
    exact_rem = []
    guess.zip(@code).each do |guess, actual|
      guess === actual ? exact +=1 : guess_rem.push(guess) && exact_rem.push(actual)
    end
    guess_rem.each do |guess|
      if exact_rem.include?(guess)
        index = exact_rem.index(guess)
        exact_rem.delete_at(index)
        close += 1
      end
    end
    p "Exact matches: #{exact}"
    p "Close matches: #{close}"
  end
end