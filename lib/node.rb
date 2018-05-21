class Node
  attr_accessor :data, :ref

  def initialize(data = nil, ref = nil)
    @data = data
    @ref = ref
  end
end
