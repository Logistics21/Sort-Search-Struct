class MaxIntSet
  def initialize(max)
    @max = max
    @store = Array.new(max, false)
  end

  def insert(num)
    validate!(num) if is_valid?(num) && !@store[num]
  end

  def remove(num)
    validate!(num) if is_valid?(num) && @store[num]
  end

  def include?(num)
    @store[num] if is_valid?(num) && @store[num]
  end

  private

  def is_valid?(num)
    raise "Out of bounds" if num > @max || num < 0
    true
  end

  def validate!(num)
    @store[num] = @store[num] ? false : true
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
  end

  def remove(num)
  end

  def include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
  end

  def remove(num)
  end

  def include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
  end
end
