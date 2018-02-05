RSpec.describe Train::Tax::Calculator do
  it "returns 3_000" do
    expect(Train::Tax::Calculator.monthly(5_000)).to eq 3_000
  end
end
