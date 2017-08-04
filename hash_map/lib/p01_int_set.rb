class MaxIntSet
  def initialize(max)
    @max = max
    @store = Array.new(max, false)
  end

  # O(1)
  def insert(num)
    validate!(num) if is_valid?(num) && !@store[num]
  end

  # O(1)
  def remove(num)
    validate!(num) if is_valid?(num) && @store[num]
  end

  # O(1)
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

  #O(n)
  #finding the bucket is O(1)
  #and pushing onto ruby's dynamic array is O(1)
  #but iterating through the array using inlcude? is O(n)
  def insert(num)
    self[num].push(num) unless include?(num)
  end

  #O(n)
  #same here, that darn include? method
  def remove(num)
    self[num].delete(num) if include?(num)
  end

  #O(n)
  #the source of our problems
  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count, :store

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  #O(1) ammortized
  def insert(num)
    unless include?(num)
      resize! if count == num_buckets
      self[num].push(num)
      @count += 1
    end
  end

  def remove(num)
    if include?(num)
      self[num].delete(num)
      @count -= 1
    end
  end

  def include?(num)
    self[num].include?(num)
  end

  # private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    dub = num_buckets*2
    new_store = Array.new(dub) { Array.new }

    store.each { |bkt| new_store[bkt[0] % dub].push(bkt[0]) }

    @store = new_store
  end
end
