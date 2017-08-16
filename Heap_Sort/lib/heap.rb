class BinaryMinHeap
  def initialize(&prc)
    @store = []
    self.prc = prc ||= Proc.new { |x, y| x <=> y }
  end

  def count
    store.length
  end

  def extract
    raise "Heap is empty" if count == 0
    @store[0], @store[-1] = @store[-1], @store[0]
    last = @store.pop
    BinaryMinHeap.heapify_down(@store, 0)
    last
  end

  def peek
    raise "Heap is empty" if length == 0
    @store[0]
  end

  def push(val)
    @store.push(val)
    BinaryMinHeap.heapify_up(@store, @store.length-1, &prc)
  end

  protected
  attr_accessor :prc, :store

  public
  def self.child_indices(len, parent_index)
    kids = (parent_index * 2) + 1

    [kids, kids+1].select { |idx| idx < len }
  end

  def self.parent_index(child_index)
    raise "root has no parent" if child_index == 0

    (child_index - 1) / 2
  end

  def self.heapify_down(array, parent_idx, len = array.length, &prc)
    prc ||= Proc.new { |x, y| x <=> y }

    k1, k2 = child_indices(len, parent_idx)

    kids = []
    kids.push(array[k1]) if k1
    kids.push(array[k2]) if k2

    mom = array[parent_idx]

    if kids.all? { |kid| prc.call(mom, kid) <= 0 }
      return array
    end

    if kids.length > 1
      i = prc.call(kids[0], kids[1]) <= 0 ? k1 : k2
    else
      i = k1
    end

    array[parent_idx], array[i] = array[i], array[parent_idx]
    heapify_down(array, i, len, &prc)
  end

  def self.heapify_up(array, child_idx, len = array.length, &prc)
    prc ||= Proc.new { |x,y| x <=> y }

    return array if child_idx == 0

    mom_spot = self.parent_index(child_idx)
    mom = array[mom_spot]
    kid = array[child_idx]

    if prc.call(mom, kid) >= 0
      array[mom_spot], array[child_idx] = array[child_idx], array[mom_spot]
      heapify_up(array, mom_spot, &prc)
    else
      return array
    end
  end
end
