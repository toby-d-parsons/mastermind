class CodeMaker
  attr_reader :code, :code_colored, :exact, :close
  def initialize
    @code = [get_random_color, get_random_color, get_random_color, get_random_color]
    @code_colored = @code.map do |color|
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
  def get_random_color
    $choices.sample
  end
  def has_won?(guess)
    guess === @code
  end
  def give_feedback(guess)
    @exact = 0
    @close = 0
    guess_rem = []
    exact_rem = []
    guess.zip(@code).each do |guess, actual|
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