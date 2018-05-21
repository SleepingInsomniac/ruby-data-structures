require_relative 'node'

# Linked list implementation of a stack
class LLStack
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
    @head = @head.ref
    data
  end
end
