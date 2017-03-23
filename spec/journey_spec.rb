require "journey"

describe Journey do

  subject(:journey) {described_class.new(entry_station, exit_station)}
  let(:entry_station) {:start_journey}
  let(:exit_station) {:end_journey}

  let(:journey_history) { {entry_station: entry_station, exit_station: exit_station} }

  let(:journey2) {described_class.new(nil, nil)}
  let(:uncomplete_history) { {entry_station: nil, exit_station: nil } }

  let(:journey3) {described_class.new(entry_station, nil)}
  let(:uncomplete_history2) { {entry_station: entry_station, exit_station: nil } }

  let(:journey4) {described_class.new(nil, exit_station)}
  let(:uncomplete_history3) { {entry_station: nil, exit_station: exit_station } }

  let(:penalty) { {penalty: "Penalty Fare £6"} }

  context "Complete journey" do

    describe 'Stations' do
      describe '#entry_station' do
        it "Check starting station" do
          expect(journey.entry_station).to eq entry_station
        end
      end

      describe '#exit_station' do
        it "Check exit station" do
          expect(journey.exit_station).to eq exit_station
        end
      end
    end

    describe '#fare' do
      it "Check minimum fare charge" do
        expect(journey.fare).to eq Journey::MINIMUM_FARE
      end
    end

    describe '#finish' do
      it "Check journey history" do
        expect(journey.finish).to eq journey_history
      end
    end

  end

  context "Uncomplete journey" do

  describe 'Stations' do
    describe '#entry_station & #exit_station' do
      it "Check journey with no starting and exit station" do
        expect(journey2.entry_station).to eq nil
        expect(journey2.exit_station).to eq nil
      end
    end

    describe '#exit_station' do
      it "Check journey with no exit station" do
        expect(journey3.exit_station).to eq nil
      end
    end

    describe '#entry_station' do
      it "Check journey with no starting station" do
        expect(journey4.entry_station).to eq nil
      end
    end
  end

    describe 'Charges' do
      describe "#fare" do
        it 'Check penalty fare with no starting and exit station' do
          expect(journey2.fare).to eq Journey::PENALTY_FARE
        end

        it 'Check penalty fare with no exit station' do
          expect(journey3.fare).to eq Journey::PENALTY_FARE
        end

        it 'Check penalty fare with no starting station' do
          expect(journey4.fare).to eq Journey::PENALTY_FARE
        end
      end
    end

    describe 'History' do
      describe "#finish" do
        it 'Check uncomplete history with no starting and exit station' do
          expect(journey2.finish).to eq penalty
        end

        it 'Check uncomplete history with no exit station' do
          expect(journey3.finish).to eq penalty
        end

        it 'Check uncomplete history with no starting station' do
          expect(journey4.finish).to eq penalty
        end
      end
    end

  end

end
