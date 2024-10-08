module InputValidator
  include ColorInputManager

  def self.valid?(arr)
    arr.length == 4 &&
    arr.all? do |val|
      valid_color_abbrv = COLOR_KEYS.map { |x| x.to_s[0].chars.first }
      
      valid_color_abbrv.any? { |arr| arr == val}
    end
  end
end