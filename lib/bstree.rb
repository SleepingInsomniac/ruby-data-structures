class BSTree
  attr_accessor :data, :left, :right

  def initialize(data = nil, left: nil, right: nil)
    @data = data
    @left = left
    @right = right
  end

  def insert(data)
    if @data == nil
      @data = data
    else
      if (data <=> @data) <= 0
        if @left
          @left.insert(data)
        else
          @left = BSTree.new(data)
        end
      else
        if @right
          @right.insert(data)
        else
          @right = BSTree.new(data)
        end
      end
    end
  end
end
