require 'oystercard'

describe Oystercard do
  it 'has a balance' do
    expect(subject).to respond_to(:balance)
  end

  it 'should initialize with a balance' do
    expect(subject.balance.class).to eq Integer
  end

  it 'should have top-up capability' do
    expect(subject).to respond_to(:top_up).with(1).argument
  end

end
