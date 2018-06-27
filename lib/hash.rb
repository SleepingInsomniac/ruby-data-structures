class LXHash
  SIZE = 100

  class LNode
    attr_accessor :key, :data, :next

    def initialize(_key, _data, _next = nil)
      @key = _key
      @data = _data
      @next = _next
    end
  end

  attr_reader :array

  def initialize
    @array = []
  end

  def index(key)
    key.chars.reduce(0) { |t, c| c.to_i(26) + t } % SIZE
  end

  def []=(key, value)
    _index = index(key)
    _node = LNode.new(key, value)
    if @array[_index] && @array[_index].key != key
      node(key).next = _node
    else
      @array[_index] = _node
    end
  end

  def [](key)
    node(key)&.data
  end

  private

  def node(key)
    _index = index(key)
    if _node = @array[_index]
      _node = _node.next if _node.next until _node.key == key || !_node.next
    end
    _node
  end
end
