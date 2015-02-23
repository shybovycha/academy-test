describe City do
  before(:each) do
    @city = City.new(name: 'Kraków', short_name: 'KRK')
  end

  subject { @city }

  it "check attributes" do
    should respond_to(:name)
    should respond_to(:short_name)
  end

  it "#email returns a string" do
    expect(@city.name).to eq 'Kraków'
    expect(@city.short_name).to eq 'KRK'
  end
end
