require 'station'


describe 'Station' do

  it "should return it should return zone" do
    station = Station.new(2, "Oval")
    expect(station.zone).to eq 2
  end
  it "should return the name of the station" do
    station = Station.new(2, "Oval")
    expect(station.name).to eq "Oval"
  end
end
