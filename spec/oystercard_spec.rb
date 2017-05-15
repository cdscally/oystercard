require 'oystercard'

describe Oystercard do
  it 'has a balance' do
    expect(subject).to respond_to(:balance)
  end

  it 'should initialize with a balance' do
    expect(subject.balance.class).to eq Integer
  end

  it { is_expected.to respond_to(:top_up).with(1).argument }

  describe '#top_up' do

    it 'should top up by a specified amount' do
      expect { subject.top_up(10) }.to change{ subject.balance }.by 10
    end

    it 'should raise an error if balance is topped up above maximum balance' do
      expect { subject.top_up(Oystercard::MAX_BALANCE+1) }.to raise_error "Maximum balance is £#{Oystercard::MAX_BALANCE}. You cannot top up more than £#{Oystercard::MAX_BALANCE-subject.balance}."
    end

  end

  it 'should have a maximum balance' do
    expect(!!Oystercard::MAX_BALANCE).to eq true
  end

  it { is_expected.to respond_to(:deduct).with(1).argument }

  describe '#deduct' do

    it 'should deduct by a specified amount' do
      card = subject.top_up(10)
      expect { card.deduct(2) }.to change{ card.balance }.by -2
    end

  end

  it { is_expected.to respond_to (:in_use) }

  describe '#in_use' do

    it 'should return true or false' do
      expect([true, false].include? subject.in_use).to eq true
    end

  end

  it { is_expected.to respond_to (:touch_in) }

  describe '#touch_in' do

     it 'should change in_use attribute to true when called' do
       expect(subject.touch_in.in_use).to eq true
     end

  end

  it { is_expected.to respond_to (:touch_out) }

  describe '#touch_out' do

     it 'should change in_use attribute to false when called' do
       expect(subject.touch_in.touch_out.in_use).to eq false
     end

  end

  it { is_expected.to respond_to (:in_journey?) }

  describe '#in_journey?' do

    it 'should return true or false' do
      expect([true, false].include? subject.in_journey?).to eq true
    end

    it 'should return true if a new card is touched in' do
      expect(subject.touch_in).to be_in_journey
    end
    it 'should return false if a new card is touched in and touched out' do
      expect(subject.touch_in.touch_out).not_to be_in_journey
    end

  end

end
