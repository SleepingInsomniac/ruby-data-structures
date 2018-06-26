#!/usr/bin/env ruby

class Union
  class Node
    attr_accessor :data, :parent, :children

    def initialize(data, children = [], parent = nil)
      @data = data
      @children = children
      @parent = parent
    end

    def root=(other)
      if @parent
        @parent.root = other.root
      else
        @parent = other.root
      end
    end

    def root
      @parent ? @parent = @parent.root : self
    end

    def size
      @children.length + @children.reduce(0) { |t, c| t + c.size }
    end

    def <<(other)
      other.root = root
      @children << other
    end
  end

  def initialize(*data)
    @nodes = []
    add(*data)
  end

  def add(*data)
    data.each do |datum|
      node = Node.new(datum)
      @nodes << node
    end
  end

  def link(n1, n2)
    node_1 = node_for(n1)
    node_2 = node_for(n2)
    if node_1.size < node_2.size
      node_1 << node_2
    else
      node_2 << node_1
    end
  end

  def linked?(n1, n2)
    node_for(n1).root == node_for(n2).root
  end

  def to_s
    @nodes.map do |node|
      "#{node.data} => #{node.root.data}"
    end.inspect
  end

  def node_for(data)
    @nodes.find { |n| n.data == data }
  end
end
