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
    @store[index]
  end

  # O(1)
  def []=(index, value)
    self.resize! if index > capacity
    @store[index] = value
  end

  # O(1)
  def pop

    @store[length-1] = nil
  end

  # O(1) ammortized; O(n) worst case. Variable because of the possible
  # resize.
  def push(val)
    # if
    @store[length-1] = val
    length += 1
  end

  # O(n): has to shift over all the elements.
  def shift
  end

  # O(n): has to shift over all the elements.
  def unshift(val)
  end

  # protected
  attr_accessor :capacity, :store
  attr_writer :length

  def check_index(index)
    # raise "index out of bounds" if index >= length ||
  end

  # O(n): has to copy over all the elements to the new store.
  def resize!
    new_store = StaticArray.new(@capacity*2)

    i = 0
    while i < @capacity
      new_store[i] = @store[i]
      i += 1
    end

    @capacity = @capacity*2
    @store = new_store
  end
end

x = DynamicArray.new
p x
x.resize!
p x
