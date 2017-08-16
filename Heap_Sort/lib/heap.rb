require 'byebug'

class BinaryMinHeap
  def initialize(&prc)
    @store = []
  end

  def count
    store.length
  end

  def extract
  end

  def peek
  end

  def push(val)
    @store.push(val)
    # heapify_up(@store, @store.length-1)
  end

  protected
  attr_accessor :prc, :store

  public
  def self.child_indices(len, parent_index)
    kids = (parent_index * 2) + 1

    [kids, kids+1].select { |idx| idx < len }
  end

  def self.parent_index(child_index)
    # raise "root has no parent" if child_index == 0
    (child_index - 1) / 2
  end

  def self.heapify_down(array, parent_idx, len = array.length, &prc)
    prc = Proc.new { |el1, el2| -1 * (el1 <=> el2) }

    debugger
    kids = self.child_indices(len, parent_idx)
    until kids.empty?
      mom = array[parent_idx]
      if prc.call(mom, array[kids[0]]) > 0
        array[parent_idx], array[kids[0]] =
        array[kids[0]], array[parent_idx]
        parent_idx = kids[0]
      elsif kids.length > 1 && prc.call(mom, array[kids[1]]) > 0
        array[parent_idx], array[kids[1]] =
        array[kids[1]], array[parent_idx]
        parent_idx = kids[1]
      else
        break
      end

      kids = self.child_indices(len, parent_idx)
    end

    array
  end

  def self.heapify_up(array, child_idx, len = array.length, &prc)
    prc ||= Proc.new { |x,y| x <=> y }

    until child_idx < 1
      mom_spot = self.parent_index(child_idx)
      mom = array[mom_spot]
      kid = array[child_idx]

      if prc.call(mom, kid) > 0
        array[mom_spot], array[child_idx] =
        array[child_idx], array[mom_spot]
        child_idx = mom_spot
      else
        break
      end
    end

    array
  end
end

p BinaryMinHeap.heapify_down([1, 2, 3], 0)
p BinaryMinHeap.heapify_down([1, 5, 4, 3], 0)
