require "journey"

describe Journey do

  subject(:journey) {described_class.new(start, finish)}
  let(:start) {:starting_journey}
  let(:finish) {:finishing_journey}

  it "checks that the journey is starting" do
    expect(journey.start).to eq start
  end

  it "checks that the journey is ending" do
    expect(journey.finish).to eq finish
  end

end
