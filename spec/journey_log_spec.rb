require "journey_log"

describe JourneyLog do

  subject(:journey_log) {described_class.new}
  let(:journey_class) {double(:journey_class, entry_station: entry_station)}
  let(:entry_station) {:entry_station}
  let(:exit_station) {:exit_station}
  let(:completed_journey) { {entry_station: entry_station, exit_station: exit_station} }

  describe "set up" do
    it "has an empty journeys array when initialized" do
      expect(journey_log.journeys).to be_empty
    end


  end

  describe "#start & #current_journey" do

    it "initialize a new Journey class with an entry station" do
      journey_log.start(entry_station)
      expect(journey_log.current_journey).not_to be(nil)

    end
  end

  describe "#finish" do

    it "passes a station to the current_journey class" do
      journey_log.start(entry_station)
      journey_log.finish(exit_station)
      expect(journey_log.current_journey.finish).to eq(completed_journey)
    end

    it "adds the completed journey to the journeys array" do

    end

    it "resets the current_journey class to nil" do

    end

  end

end
