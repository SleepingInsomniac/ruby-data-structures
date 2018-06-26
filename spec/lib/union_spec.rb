require 'union'

RSpec.describe Union do

  subject { Union.new *(1..9).to_a }

  it 'connects correctly' do
    subject.link 4, 6
    expect(subject.linked?(4, 6)).to eq(true)
    subject.link 3, 6
    expect(subject.linked?(3, 6)).to eq(true)
    subject.link 5, 3
    expect(subject.linked?(5, 6)).to eq(true)
    expect(subject.linked?(5, 3)).to eq(true)
  end

  it 'does not care about order' do
    subject.link 4, 6
    subject.link 4, 3
    expect(subject.linked?(3, 4)).to eq(true)
  end

  it 'does not overwrite links' do
    subject.link 1,2
    subject.link 3,4
    subject.link 1,5
    expect(subject.linked?(2,5)).to eq(true)
  end

end
