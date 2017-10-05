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


# Given an array of numbers find the largest collection of contiguous
# (i.e unbroken or numbers in a row) with the biggest sum
def max_sub(arr)
  return arr[0] if arr.length == 1
  max_sub_arr = []
  max_global = max_current = arr[0]
  start, fin = 0, nil

  1.upto(arr.length-1) do |i|
    if arr[i] > arr[i] + max_current
      max_current = arr[i]
      start = i
      max_sub_arr = []
    else
      max_current += arr[i]
    end

    if max_current > max_global
      max_global, fin = max_current, i
    end
  end

  start.upto(fin) { |i| max_sub_arr.push(arr[i]) }
  max_sub_arr
end

p max_sub(x)

class ListNode
    attr_accessor :val, :next
    def initialize(val)
        @val = val
        @next = nil
    end
end

def merge_two_lists(l1, l2)
 plchldr = curr = ListNode.new(0)
    while l1 && l2
        if l1.val < l2.val
            curr.next = l1
            l1 = l1.next
        else
            curr.next = l2
            l2 = l2.next
        end

        curr = curr.next
        curr.next = l1 || l2
    end

    return plchldr.next
end

def merge_two_lists2(l1, l2)
  plchldr = curr = ListNode.new(0)
  plchldr.next = l1
  while l1 && l2
    if l1.val < l2.val
      # curr.next = l1
      l1 = l1.next
    else
      nxt = curr.next
      curr.next = l2
      tmp = l2.next
      l2.next = nxt
      l2 = tmp
    end

    curr = curr.next
    curr.next = l1 || l2
  end

  plchldr
end

def has_cycle?(node)
  return false if node.nil?

  fast = node.next
  slow = node

  while !fast.next.nil? && slow
    return true if fast == slow

    fast = fast.next.next
    slow = slow.next
  end

  return false
end
