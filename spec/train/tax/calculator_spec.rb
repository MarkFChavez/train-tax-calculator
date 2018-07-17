RSpec.describe Train::Tax::Calculator do

  describe ".call" do
    context "salary is a negative number" do
      it "returns 0.00" do
        result = described_class.(-500)
        expect(result).to eq 0.00
      end
    end

    context "with valid salary amount given" do
      it "returns the correct response" do
        result = described_class.(20_000)

        expect(result).to have_key(:sss)
        expect(result).to have_key(:pagibig)
        expect(result).to have_key(:philhealth)
        expect(result).to have_key(:total_deductions)
        expect(result).to have_key(:withholding_tax)
        expect(result).to have_key(:net_income)
      end
    end
  end
end
