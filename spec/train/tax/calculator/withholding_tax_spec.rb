RSpec.describe Train::Tax::Calculator::WithholdingTax do

  describe ".compute" do
    context "20,833 and below" do
      it "has a withholding tax of 0.00" do
        expect(subject.compute(20_000.00)).to eq 0.00
        expect(subject.compute(15_000.00)).to eq 0.00
        expect(subject.compute(5_000.00)).to eq 0.00
      end
    end

    context "a base salary of 30,000" do
      it "has a withholding tax of 1,614.64" do
        expect(subject.compute(30_000.00)).to eq 1_614.64
      end
    end

    context "a base salary of 50,000" do
      it "has a withholding tax of 6,358.92" do
        expect(subject.compute(50_000.00)).to eq 6_358.92
      end
    end

    context "a base salary of 100,000" do
      it "has a withholding tax of 20,713.84" do
        expect(subject.compute(100_000.00)).to eq 20_713.84
      end
    end

    context "a base salary of 800,000" do
      it "has a withholding tax of 267,777.26" do
        expect(subject.compute(800_000.00)).to eq 267_777.26
      end
    end
  end

end

