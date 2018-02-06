RSpec.describe Train::Tax::Calculator do

  describe ".call" do
    context "20,833 and below" do
      it "has a withholding tax of 0.00" do
        expect(subject.(20_000.00)[:withholding_tax]).to eq 0.00
        expect(subject.(15_000.00)[:withholding_tax]).to eq 0.00
        expect(subject.(5_000.00)[:withholding_tax]).to eq 0.00
      end

      it "has a net income = basic salary" do
        expect(subject.(20_000.00)[:net_income]).to eq 20_000.00
        expect(subject.(15_000.00)[:net_income]).to eq 15_000.00
        expect(subject.(5_000.00)[:net_income]).to eq 5_000.00
      end
    end

    context "a base salary of 30,000" do
      it "has a withholding tax of 1,614.64" do
        expect(subject.(30_000.00)[:withholding_tax]).to eq 1_614.64
      end

      it "has a net income of (basic salary - withholding tax)" do
        expect(subject.(30_000.00)[:net_income]).to eq (30_000 - 1_614.64)
      end
    end

    context "a base salary of 50,000" do
      it "has a withholding tax of 6,358.92" do
        expect(subject.(50_000.00)[:withholding_tax]).to eq 6_358.92
      end

      it "has a net income of (basic salary - withholding tax)" do
        expect(subject.(50_000.00)[:net_income]).to eq (50_000 - 6_358.92)
      end
    end

    context "a base salary of 100,000" do
      it "has a withholding tax of 20_463.84" do
        expect(subject.(100_000.00)[:withholding_tax]).to eq 20_463.84
      end

      it "has a net income of (basic salary - withholding tax)" do
        expect(subject.(100_000.00)[:net_income]).to eq (100_000 - 20_463.84)
      end
    end

    context "a base salary of 800,000" do
      it "has a withholding tax of 247_068.92" do
        expect(subject.(800_000.00)[:withholding_tax]).to eq 247_068.92
      end

      it "has a net income of (basic salary - withholding tax)" do
        expect(subject.(800_000.00)[:net_income]).to eq (800_000 - 247_068.92)
      end
    end
  end

end
