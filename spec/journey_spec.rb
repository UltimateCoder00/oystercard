require "journey"

describe Journey do

  subject(:journey) {described_class.new(entry_station, exit_station)}
  let(:journey2) {described_class.new(nil, nil)}
  let(:journey3) {described_class.new(entry_station, nil)}
  let(:journey4) {described_class.new(nil, exit_station)}

  let(:entry_station) {:start}
  let(:exit_station) {:exit}

  context "complete journey" do

    it "journey has a starting point" do
      expect(journey.entry_station).to eq entry_station
    end

    it "journey has an exit station" do
      expect(journey.exit_station).to eq exit_station
    end

    it "journey has starting and exit stations" do
      expect(journey.complete?).to eq true
    end

  end

  context "uncomplete journey" do

    it "journey has no starting and no exit station" do
      expect(journey2.entry_station).to eq nil
      expect(journey2.exit_station).to eq nil
      expect(journey2.complete?).to eq false
    end

    it "journey has no exit station" do
      expect(journey3.exit_station).to eq nil
      expect(journey3.complete?).to eq false
    end

    it "journey has no starting station" do
      expect(journey4.entry_station).to eq nil
      expect(journey4.complete?).to eq false
    end

  end

end
