require 'oystercard'

describe Oystercard do
  it 'has a balance' do
    expect(subject).to respond_to(:balance)
  end

  it 'should initialize with a balance' do
    expect(subject.balance.class).to eq Integer
  end

  describe '#top_up' do

    it { is_expected.to respond_to(:top_up).with(1).argument }

    it 'should top up by a specified amount' do
      expect { subject.top_up(10) }.to change{ subject.balance }.by 10
    end

  end

  it 'should have a maximum balance' do
    expect(!!Oystercard::MAX_BALANCE).to eq true
  end

end
