# Linked list implementation of a stack
class LLStack
  # Node contains a reference to the previous node and it's data
  class Node
    attr_accessor :data, :prev

    def initialize(data = nil, prev = nil)
      @data = data
      @prev = prev
    end
  end

  attr_reader :size

  def initialize
    @head = nil
    @size = 0
  end

  def push(data)
    @size += 1
    @head = Node.new(data, @head)
  end

  def pop
    return nil unless @head
    @size -= 1
    data = @head.data
    @head = @head.prev
    data
  end
end
