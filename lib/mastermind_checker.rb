module MastermindChecker
  def self.check_matches(arr1, arr2)
    feedback = [0, 0] # [exact matches, close matches]
    arr3_temp = []
    arr4_temp = []

    arr1.zip(arr2).each do |item1, item2|
      item1 === item2 ? feedback[0] += 1 : arr3_temp.push(item1) && arr4_temp.push(item2)
    end

    arr3_temp.each do |element|
      arr4_temp.delete_at(arr4_temp.index(element)) if arr4_temp.include?(element)
    end
    close_matches = arr4_temp.length
    feedback[1] = close_matches

    return feedback
  end
end