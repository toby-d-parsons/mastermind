module ColorInputManager
  COLOR_KEYS = ['r', 'g', 'b', 'y', 'p', 'c']

  def self.colorize_text(arr)
    arr.map do |color|
      case color
      when 'r'
        "\e[31mr\e[0m" # Red
      when 'g'
        "\e[32mg\e[0m" # Green
      when 'b'
        "\e[34mb\e[0m" # Blue
      when 'y'
        "\e[33my\e[0m" # Yellow
      when 'p'
        "\e[35mp\e[0m" # Pink
      when 'c'
        "\e[36mc\e[0m" # Cyan
      when 'd'
        "\e[30md\e[0m" # Dark grey - currently not in use
      when 'w'
        "\e[37mw\e[0m" # White - currently not in use
      end
    end
  end
  COLOR_KEYS_FORMATTED = colorize_text(COLOR_KEYS)
end