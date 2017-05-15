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

  it 'should top up by a specified amount' do
    expect(subject.top_up(10).balance).to eq 10
  end

end
