require_relative "static_array"
require 'byebug'

class RingBuffer
  attr_reader :length

  def initialize
    @store, @capacity, @start_idx, @length = StaticArray.new(8), 8, 0, 0
  end

  # O(1)
  def [](index)
    check_index(index)
    store[(start_idx + index) % capacity]
  end

  # O(1)
  def []=(index, val)
    check_index(index)
    store[(start_idx + index) % capacity] = val
  end

  # O(1)
  def pop
    raise "index out of bounds" if length == 0

    val, self[length - 1] = self[length - 1], nil
    @length -= 1
    val
  end

  # O(1) ammortized
  def push(val)
    resize! if length == capacity
    @length += 1
    self[length-1] = val
  end

  # O(1)
  def shift
    raise "index out of bounds" if length == 0
    val, self[0] = self[0], nil
    @start_idx = (start_idx + 1) % capacity
    @length -= 1
    val
  end

  # O(1) ammortized
  def unshift(val)
    resize! if length == capacity

    @start_idx = (start_idx - 1) % capacity
    @length += 1
    self[0] = val
  end

  protected
  attr_accessor :capacity, :start_idx, :store
  attr_writer :length

  def check_index(index)
    raise "index out of bounds" unless index >= 0 && index < length
  end

  def resize!
    new_store = StaticArray.new(capacity*2)

    i = 0
    while i < length
      new_store[i] = self[i]
      i += 1
    end

    @capacity *= 2
    @start_idx = 0
    @store = new_store
  end
end
