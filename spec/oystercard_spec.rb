require 'oystercard'
require 'journey'

describe Oystercard do
  subject(:card) {described_class.new}

  let(:entry_station) {:station}
  let(:exit_station) {:station}

  let(:journey) { {entry_station: entry_station, exit_station: exit_station} }

  top_up_amount = 20

  describe "#balance" do
    it "Check card balance at initialization" do
      expect(card.balance).to eq 0
    end

    it "Check card balance with £#{top_up_amount} top up" do
      card.top_up(top_up_amount)
      expect(card.balance).to eq top_up_amount
    end
  end

  describe "#top_up" do
    it "Error: Check topping up over £#{Oystercard::CARD_LIMIT} limit" do
      message = "Cannot top-up card: Exceeds limit of £#{Oystercard::CARD_LIMIT}."
      expect{card.top_up(Oystercard::CARD_LIMIT + top_up_amount)}.to raise_error message
    end
  end

  describe "#touch_in" do
    it "Error: Cannot touch in if balance < £#{Oystercard::MINIMUM_BALANCE}" do
      expect{card.touch_in(entry_station)}.to raise_error "Can't touch in, balance too low"
    end
  end

  describe "#entry_station & #touch_in" do
    it 'Check entry station' do
      card.top_up(top_up_amount)
      card.touch_in(entry_station)
      expect(card.entry_station).to eq entry_station
    end
  end

  describe "#touch_out" do
    it 'Charge card by minimum amount at touch out' do
      card.top_up(top_up_amount)
      card.touch_in(entry_station)
      expect{card.touch_out(exit_station)}.to change{card.balance}.by -Oystercard::MINIMUM_BALANCE
    end
  end

  describe "#journey" do
    it 'Check journey travelled' do
      card.top_up(top_up_amount)
      card.touch_in(entry_station)
      card.touch_out(exit_station)
      expect(card.card_history).to eq [journey]
    end
  end

  describe "#history" do
    it 'Check history of journeys' do
      card.top_up(top_up_amount)
      card.touch_in(entry_station)
      card.touch_out(exit_station)
      expect(card.card_history).to eq [journey]
    end
  end

end
