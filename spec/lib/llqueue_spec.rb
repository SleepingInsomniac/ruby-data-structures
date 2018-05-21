require 'llqueue'

RSpec.describe Queue do
  it 'enqueues and dequeues' do
    q = LLQueue.new
    1.upto(10) do |x|
      q.enqueue(x)
    end

    1.upto(10) do |x|
      expect(q.dequeue).to eq(x)
    end
  end
end