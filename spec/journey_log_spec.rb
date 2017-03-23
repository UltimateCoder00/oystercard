require "journey_log"

describe JourneyLog do

  subject(:journey_log) {described_class.new}
  let(:journey_class) {double(:journey_class, entry_station: entry_station)}
  let(:entry_station) {:entry_station}

  describe "set up" do
    it "has an empty journeys array when initialized" do
      expect(journey_log.journeys).to be_empty
    end


  end

  describe "#start" do

    it "initialize a new Journey class with an entry station" do
      journey_log.start(entry_station)
      expect(journey_log.current_journey).not_to be(nil)

    end
  end

end
