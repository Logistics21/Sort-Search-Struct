# This class just dumbs down a regular Array to be staticly sized.
class StaticArray
  def initialize(length)
    @store = Array.new(length, nil)
  end

  # O(1)
  def [](index)
    self[index]
  end

  # O(1)
  def []=(index, value)
    self[index] = value
  end

  protected
  attr_accessor :store
end
