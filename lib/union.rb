#!/usr/bin/env ruby

class Union
  class Node
    attr_accessor :id, :data

    def initialize(id, data, root = nil)
      @id = id
      @data = data
      @root = root
    end

    def root=(value)
      @root = @root ? @root.root : value
    end

    def root
      @root ? @root.root : self
    end
  end

  def initialize(*data)
    @auto_increment = 0
    @nodes = []
    add(*data)
  end

  def next_id
    @auto_increment += 1
  end

  def add(*data)
    data.each do |datum|
      node = Node.new(next_id, datum)
      @nodes << node
    end
  end

  def link(n1, n2)
    node_for(n1).root = node_for(n2)
  end

  def connected?(n1, n2)
    node_for(n1).root == node_for(n2).root
  end

  def to_s
    @nodes.map do |node|
      "#{node.data} => #{node.root.data}"
    end.inspect
  end

  private

  def node_for(data)
    @nodes.find { |n| n.data == data }
  end
end
