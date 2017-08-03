require_relative "static_array"
require 'byebug'


class DynamicArray
  attr_reader :length

  def initialize
    @store, @length, @capacity = StaticArray.new(8), 0, 8
  end

  # O(1)
  def [](index)
    check_index(index)
    store[index]
  end

  # O(1)
  def []=(index, value)
    # resize! if index > capacity
    store[index] = value
  end

  # O(1)
  def pop
    check_index(length-1)
    store[length-1] = nil
    @length -= 1
  end

  # O(1) ammortized; O(n) worst case. Variable because of the possible
  # resize.
  def push(val)
    resize! if length == capacity
    store[length] = val
    @length += 1
  end

  # O(n): has to shift over all the elements.
  def shift
    check_index(length-1)
    i = 0
    while i < length
      store[i] = store[i+1]
      i += 1
    end

    @length -= 1
  end

  # O(n): has to shift over all the elements.
  def unshift(val)
    resize! if length == capacity
    i = length

    while i >= 0
      if i == 0
        store[i] = val
        break
      end

      store[i] = store[i-1]
      i -= 1
    end

    @length += 1
  end

  protected
  attr_accessor :capacity, :store
  attr_writer :length

  def check_index(index)
    raise "index out of bounds" unless index >= 0 && index < length
  end

  # O(n): has to copy over all the elements to the new store.
  def resize!
    new_store = StaticArray.new(capacity*2)

    i = 0
    while i < length
      new_store[i] = self[i]
      i += 1
    end

    self.capacity *= 2
    self.store = new_store
  end
end
