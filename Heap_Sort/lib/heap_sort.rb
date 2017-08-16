require_relative "heap"

class Array
  def heap_sort!
    2.upto(count).each do |idx|
      BinaryMinHeap.heapify_up(self, idx-1, idx)
    end

    count.downto(2).each do |idx|
      self[idx-1], self[0] = self[0], self[idx-1]
      BinaryMinHeap.heapify_down(self, 0, idx-1)
    end

    self.reverse!
  end
end
