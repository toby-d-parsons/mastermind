class CodeMaker
  attr_reader :CODE_COLORED, :exact, :close
  include ColorInputManager
  def initialize
    @CODE = [get_random_color, get_random_color, get_random_color, get_random_color]
    @CODE_COLORED = ColorInputManager.colorize_text(@CODE)
    # p @CODE
  end
  def get_random_color
    COLOR_KEYS.sample
  end
  def has_won?(guess)
    guess === @CODE
  end
  def give_feedback(guess)
    @exact = 0
    @close = 0
    guess_rem = []
    exact_rem = []
    guess.zip(@CODE).each do |guess, actual|
      guess === actual ? @exact +=1 : guess_rem.push(guess) && exact_rem.push(actual)
    end
    guess_rem.each do |guess|
      if exact_rem.include?(guess)
        index = exact_rem.index(guess)
        exact_rem.delete_at(index)
        @close += 1
      end
    end
  end
end