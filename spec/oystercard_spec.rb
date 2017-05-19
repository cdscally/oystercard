require 'oystercard'

describe Oystercard do

  let(:station) { double(:station) }
  subject(:card) { described_class.new }

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

  # since #deduct is a private method, we want to make sure that it cannot be called from outside
  it { is_expected.not_to respond_to(:deduct) }

  it { is_expected.to respond_to (:touch_in) }

  describe '#touch_in' do
    it 'should raise an error if the balance is below MIN_FARE' do
      expect { card.touch_in(:station) }.to raise_error "Balance below minimum fare. Please top-up."
    end

    it 'should initialize a journey when called' do
      card.top_up(90).touch_in(:station)
      expect(!!card.journey_log.journey).to eq true
    end

    it 'should charge the minimum fare if the card is already touched in' do
      card.top_up(90).touch_in(:station)
      expect { card.touch_in(:station) }.to change { card.balance }.by (-Journey::PEN_FARE)
    end
  end

  it { is_expected.to respond_to (:touch_out) }

  describe '#touch_out' do

    before(:each) {card.top_up(90)}
     it 'should reset the journey when called' do
       card.touch_in(:station).touch_out(:station)
       expect(!!card.journey).to eq false
     end

     it 'should deduct the minimum fare' do
       expect { card.touch_in(:station).touch_out("Oval")}.to change{ card.balance }.by (-Journey::MIN_FARE)
     end

  end

end
