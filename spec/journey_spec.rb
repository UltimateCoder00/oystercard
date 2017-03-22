require "journey"

describe Journey do

  subject(:journey) {described_class.new(start, finish, fare, complete)}
  let(:start) {:starting_journey}
  let(:finish) {:finishing_journey}
  let(:fare) {:journey_fare}
  let(:complete) {:complete_journey}

  it "checks that the journey is starting" do
    expect(journey.start).to eq start
  end

  it "checks that the journey is ending" do
    expect(journey.finish).to eq finish
  end

  it "calculates fare of a journey" do
    expect(journey.fare).to eq fare
  end

  it "checks if the journey is complete" do
    expect(journey.complete).to eq complete
  end

end
