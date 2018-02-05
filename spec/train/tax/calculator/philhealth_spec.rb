RSpec.describe Train::Tax::Calculator::Philhealth do

  describe ".compute" do
    it "returns 0.00 for base lower than 1.00" do
      expect(subject.compute(0.50)).to eq 0.00
      expect(subject.compute(-100.00)).to eq 0.00
    end

    context "salary base higher than 34,000" do
      it "has an employee share of 425.00 (always)" do
        expect(subject.compute(34_500)).to eq 425.00
        expect(subject.compute(200_000)).to eq 425.00
        expect(subject.compute(1_000_000)).to eq 425.00
      end
    end

    context "salary base of 25_000" do
      it "has an employee share of 312.50" do
        expect(subject.compute(25_000)).to eq 312.50
      end
    end

    context "salary base of 16,500" do
      it "has an employee share of 200.00" do
        expect(subject.compute(16_500)).to eq 200.00
      end
    end
  end

end
