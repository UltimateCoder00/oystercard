require 'station'

describe Station do
  let(:zone) {:number}
  let(:name) {:station_name}

  subject(:station) {described_class.new(name, zone)}


  it "#station_zone" do
    expect(station.station_zone).to eq zone
  end

  it '#station_name' do
    expect(station.station_name).to eq name
  end

end
