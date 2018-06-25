require 'union'

RSpec.describe Union do

  subject { Union.new *(1..9).to_a }

  it 'connects correctly' do
    subject.link 4, 6
    expect(subject.connected?(4, 6)).to eq(true)
    subject.link 3, 6
    expect(subject.connected?(3, 6)).to eq(true)
    subject.link 5, 3
    expect(subject.connected?(5, 6)).to eq(true)
    expect(subject.connected?(5, 3)).to eq(true)
  end
end