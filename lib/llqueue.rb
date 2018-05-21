require_relative 'node'

# Linked list implementation of a queue
class LLQueue
  attr_reader :head

  def initialize
    @head = nil
    @tail = nil
  end

  def enqueue(data)
    node = Node.new(data) # Create a node
    @tail.ref = node if @tail # Update tail's pointer
    @tail = node # Set tail to the new node
    @head = @tail unless @head # Make sure head is set
    self
  end

  def dequeue
    return nil unless @head
    data = @head.data
    @head = @head.ref # Set head to the next item
    data
  end
end
