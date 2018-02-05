RSpec.describe Train::Tax::Calculator::Pagibig do

  describe ".compute" do
    it "returns 100.00 for everything" do
      expect(subject.compute(10_000)).to eq 100.00
      expect(subject.compute(40_000)).to eq 100.00
      expect(subject.compute(70_000)).to eq 100.00
      expect(subject.compute(100_000)).to eq 100.00
    end
  end

end
