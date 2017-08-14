class QuickSort
  # Quick sort has average case time complexity O(nlogn), but worst
  # case O(n**2).

  # Not in-place. Uses O(n) memory.
  def self.sort1(array)
    return array if array.length < 2

    pivot = array.sample
    left = array[1..array.index(pivot)].select { |el| el <= pivot }
    right = array[array.index(pivot)..-1].select { |el| el > pivot }

    sort1(left) + [pivot] + sort1(right)
  end

  # In-place.
  def self.sort2!(array, start = 0, length = array.length, &prc)
    return array if length < 2

    pivot_idx = partition(array, start, length, &prc)

    left_length = pivot_idx - start #first time (pivot_idx - 0)
    right_length = length - (left_length + 1) # (array.length - (pivot_idx-0) + 1)

    sort2!(array, start, left_length, &prc)
    sort2!(array, pivot_idx + 1, right_length, &prc)

    array
  end

  def self.partition(array, start, length, &prc)
    prc ||= Proc.new { |el1, el2| el1 <=> el2 }

    # To reduce probability of pathalogically bad data set, shuffle pivot.
    # new_pivot = start + rand(length)
    # array[start], array[new_pivot] = array[new_pivot], array[start]

    pivot_idx = start
    pivot = array[start]

    ((start + 1)...(start + length)).each do |idx|
      if prc.call(pivot, array[idx]) > 0
        array[idx], array[pivot_idx + 1] = array[pivot_idx + 1], array[idx]
        pivot_idx += 1
      end
    end

    array[start], array[pivot_idx] = array[pivot_idx], array[start]
    pivot_idx
  end
end
