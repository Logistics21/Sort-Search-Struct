require_relative "static_array"

class RingBuffer
  attr_reader :length

  def initialize
    @store, @length, @capacity, @start_idx = StaticArray.new(8), 0, 8, 0
  end

  # O(1)
  def [](index)
    check_index(index)
    @store[index]
    # index < 0 ? @store[@length+index] : @store[index]
  end

  # O(1)
  def []=(index, val)
    # check_index(index)
    @store[index] = val
  end

  # O(1)
  def pop
    check_index(@length-1)
    @store[@length-1] = nil
    @length -= 1
  end

  # O(1) ammortized
  def push(val)
    resize! if @length == @capacity
    @store[@length] = val
    @length += 1
  end

  # O(1)
  def shift
    check_index(@length-1)
  end

  # O(1) ammortized
  def unshift(val)
  end

  # protected
  attr_accessor :capacity, :start_idx, :store
  attr_writer :length

  def check_index(index)
    raise "index out of bounds" unless index >= 0 && index < @length
  end

  def resize!
    new_store = StaticArray.new(@capacity*2)
    i = 0
    while i < capacity
      new_store[i] = @store[i]
      i += 1
    end

    @capacity *= 2
    @store = new_store
  end
end

# x = RingBuffer.new
# x[0]= "a"
# x[1]= "b"
# x[2]= "c"
# x.length = 3
# p x[2]
