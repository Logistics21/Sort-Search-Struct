# Given an array of numbers, determine if two of those number add up to a
# target number
def two_sum(nums, target)
  freq = {}

  nums.each_with_index do |num, i|
      freq[target - num] ? (return [freq[target - num], i]) : freq[num] = i
  end

  nil
end

p two_sum([-5, 2, 2, 1, 4, 5, 7], 8)
