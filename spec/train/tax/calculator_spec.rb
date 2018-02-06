RSpec.describe Train::Tax::Calculator do

  describe ".withholding_tax" do
    context "20,833 and below" do
      it "has NO tax" do
        expect(subject.withholding_tax(20_000.00)).to eq 0.00
        expect(subject.withholding_tax(15_000.00)).to eq 0.00
        expect(subject.withholding_tax(5_000.00)).to eq 0.00
      end
    end

    context "a base salary of 30,000" do
      it "has a withholding tax of 1,614.64" do
        expect(subject.withholding_tax(30_000.00)).to eq 1_614.64
      end
    end

    context "a base salary of 50,000" do
      it "has a withholding tax of 6,358.92" do
        expect(subject.withholding_tax(50_000.00)).to eq 6_358.92
      end
    end

    context "a base salary of 100,000" do
      it "has a withholding tax of 20_463.84" do
        expect(subject.withholding_tax(100_000.00)).to eq 20_463.84
      end
    end

    context "a base salary of 800,000" do
      it "has a withholding tax of 247_068.92" do
        expect(subject.withholding_tax(800_000.00)).to eq 247_068.92
      end
    end
  end

  describe ".net_income" do
    # PENDING...
  end

end
