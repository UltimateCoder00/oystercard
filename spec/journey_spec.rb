require "journey"

describe Journey do

  subject(:journey) {described_class.new(entry_station, exit_station)}
  let(:journey2) {described_class.new(nil, nil)}
  let(:journey3) {described_class.new(entry_station, nil)}
  let(:journey4) {described_class.new(nil, exit_station)}

  let(:entry_station) {:start}
  let(:exit_station) {:exit}

  let(:journey_history) { {entry_station: entry_station, exit_station: exit_station} }
  let(:uncomplete_history) { {entry_station: nil, exit_station: exit_station } }
  let(:penalty) { {penalty: "Penalty Fare £6"} }

  context "complete journey" do

    it "journey has a starting point" do
      expect(journey.entry_station).to eq entry_station
    end

    it "journey has an exit station" do
      expect(journey.exit_station).to eq exit_station
    end

    # it "journey has starting and exit stations" do
    #   # expect(journey.complete?).to eq true
    # end

    it "charges minimum fare" do
      expect(journey.fare).to eq Journey::MINIMUM_FARE
    end

    it "returns journey history" do
      expect(journey.finish).to eq journey_history
    end

  end

  context "uncomplete journey" do

    it "journey has no starting and no exit station" do
      expect(journey2.entry_station).to eq nil
      expect(journey2.exit_station).to eq nil
      # expect(journey2.complete?).to eq false
    end

    it "journey has no exit station" do
      expect(journey3.exit_station).to eq nil
      # expect(journey3.complete?).to eq false
    end

    it "journey has no starting station" do
      expect(journey4.entry_station).to eq nil
      # expect(journey4.complete?).to eq false
    end

    it "charges penalty fare" do
      expect(journey2.fare).to eq Journey::PENALTY_FARE
    end

    it "returns an uncomplete history" do
      expect(journey4.finish).to eq penalty

    end

  end



end
