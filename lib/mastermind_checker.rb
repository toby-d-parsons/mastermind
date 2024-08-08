module MastermindChecker
  def self.check_matches(arr1, arr2)
    feedback = [0, 0] # [exact matches, close matches]
    arr3_temp = []
    arr4_temp = []
    arr1.zip(arr2).each do |item1, item2|
      item1 === item2 ? feedback[0] += 1 : arr3_temp.push(item1) && arr4_temp.push(item2)
    end
    no_match = arr3_temp - arr4_temp
    close_matches = arr3_temp.length - no_match.length
    feedback[1] = close_matches
    return feedback
  end
end