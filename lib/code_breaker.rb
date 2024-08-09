class CodeBreaker
  include ColorInputManager, InputValidator, MastermindChecker

  attr_reader :guess, :guess_colored

  def initialize(player_role)
    @player_role = player_role
    generate_combinations
  end

  def make_guess(initial_turn, turn)
    if @player_role == "code_breaker"
      input = gets.chomp.split('')

      InputValidator.valid?(input) ? @guess = input : (p 'Invalid entry. Please enter a valid entry') && make_guess(initial_turn, turn) && return

      @guess_colored = ColorInputManager.colorize_text(@guess)
    elsif turn == initial_turn
      @guess = [COLOR_KEYS[0], COLOR_KEYS[0], COLOR_KEYS[1], COLOR_KEYS[1]]
      @guess_colored = ColorInputManager.colorize_text(@guess)

      sleep(0.5)
    else
      @guess = choose_best_guess
      @guess_colored = ColorInputManager.colorize_text(@guess)

      sleep(0.5)
    end
  end

  def choose_best_guess
    largest_group = []
    @arr.each do |outer_item|
      permutations = {
        00 => 0,
        01 => 0,
        02 => 0,
        03 => 0,
        04 => 0,
        10 => 0,
        11 => 0,
        12 => 0,
        13 => 0,
        14 => 0,
        20 => 0,
        21 => 0,
        22 => 0,
        23 => 0,
        24 => 0,
        30 => 0,
        31 => 0,
        32 => 0,
        33 => 0,
        34 => 0,
        40 => 0,
        41 => 0,
        42 => 0,
        43 => 0,
        44 => 0
      }
      @arr.each do |inner_item|
        next if outer_item == inner_item
        matches = MastermindChecker.check_matches(outer_item, inner_item)
                                   .join("")
                                   .to_i
        permutations[matches] += 1
      end
      largest_group.push([outer_item, largest_hash_key(permutations)[1]])
    end
    largest_group.sort_by { |item| item[1] }
                 .first[0]
  end

  def largest_hash_key(hash)
    hash.max_by{|k,v| v}
  end

  def get_random_color
      COLOR_KEYS.sample
  end
  
  def generate_combinations
    @arr = COLOR_KEYS.repeated_permutation(4).to_a
  end

  def remove_incorrect_combs(guess_feedback)
    @arr.delete(@guess) # Removes guess from pool

    @arr = @arr.select do |item|
      keep_combination?(guess_feedback, MastermindChecker.check_matches(item, @guess))
    end
  end

  def keep_combination?(guess_feedback, potential_feedback)
    guess_feedback === potential_feedback
  end
end