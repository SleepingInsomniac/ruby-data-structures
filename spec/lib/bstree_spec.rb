require 'bstree'

RSpec.describe BSTree do
  it 'inserts correctly' do
    bst = BSTree.new
    bst.insert 5
    bst.insert 4
    bst.insert 6
    expect(bst.left.data).to eq(4)
    expect(bst.right.data).to eq(6)
  end
end