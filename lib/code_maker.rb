class CodeMaker
  attr_reader :CODE, :CODE_COLORED, :exact, :close
  include ColorInputManager, InputValidator
  def initialize(player_role)
    @player_role = player_role
    @CODE = get_code
    @CODE_COLORED = ColorInputManager.colorize_text(@CODE)
  end
  def get_code
    if @player_role == 'code_maker'
      p "Please select a 4-character code with the following choices:"
      puts "#{COLOR_KEYS_FORMATTED.join(', ')}"
      get_user_input
    else
      [get_random_color, get_random_color, get_random_color, get_random_color]
    end
  end
  def get_user_input
    input = gets.chomp.split('')
    InputValidator.is_valid?(input) ? @CODE = input : (p 'Invalid entry. Please enter a valid entry') && get_user_input && return
  end
  def get_random_color
    COLOR_KEYS.sample
  end
  def has_won?(guess)
    guess === @CODE
  end
end