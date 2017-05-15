require 'oystercard'

describe Oystercard do
  it 'has a balance' do
    expect(subject).to respond_to(:balance)
  end

  it 'should initialize with a balance' do
    expect(subject.balance.class).to eq Integer
  end
end
