require 'oystercard'

describe Oystercard do

  let(:station) { double(:station) }

  it 'has a balance' do
    expect(subject).to respond_to(:balance)
  end

  it 'should initialize with a balance' do
    expect(subject.balance.class).to eq Integer
  end

  it "should initialize with an empty list of journeys" do
    expect(subject.journeys).to eq []
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

     it 'should initialize a journey when called' do
       card = Oystercard.new.top_up(90).touch_in(:station)
       expect(!!card.journey).to eq true
     end

     it 'should raise an error if the balance is below MIN_FARE' do
       expect { subject.touch_in(:station) }.to raise_error "Balance below minimum fare. Please top-up."
     end

  end

  it { is_expected.to respond_to (:touch_out) }

  describe '#touch_out' do

     it 'should reset the journey when called' do
       card = Oystercard.new.top_up(90).touch_in(:station).touch_out(:station)
       expect(!!card.journey).to eq false
     end

     it 'should deduct the minimum fare' do
       subject.top_up(Journey::MIN_FARE)
       expect { subject.touch_in(:station).touch_out("Oval")}.to change{ subject.balance }.by (-Journey::MIN_FARE)
     end

     it "should create a journey hash when touching out" do
       card = Oystercard.new.top_up(10).touch_in("Oval").touch_out("Bank")
       expect(card.journeys[-1]).to eq ({ entry: "Oval", exit: "Bank" })
     end
  end

end
