require 'llstack'

RSpec.describe LLStack do

  it 'pushes and pops' do
    stack = LLStack.new
    3.times { |i| stack.push(i) }
    expect(stack.pop).to eq(2)
  end

end