RSpec.describe Train::Tax::Calculator::Sss do
  describe ".call" do
    context "with salary base of 15,000" do
      let!(:result) { subject.(15_000) }

      it "has correct amount of shares" do
        expect(result[:employee_share]).to eq 545.00
        expect(result[:employer_share]).to eq 1_135.00
        expect(result[:total_share]).to eq 545.00 + 1_135.00
      end
    end

    context "with salary base of 25,000" do
      let!(:result) { subject.(25_000) }

      it "has correct amount of shares" do
        expect(result[:employee_share]).to eq 581.30
        expect(result[:employer_share]).to eq 1_208.70
        expect(result[:total_share]).to eq 581.30 + 1_208.70
      end
    end

    context "with salary base of 50,000" do
      let!(:result) { subject.(50_000) }

      it "has correct amount of shares" do
        expect(result[:employee_share]).to eq 581.30
        expect(result[:employer_share]).to eq 1_208.70
        expect(result[:total_share]).to eq 581.30 + 1_208.70
      end
    end

    context "with salary base of 80,000" do
      let!(:result) { subject.(80_000) }

      it "has correct amount of shares" do
        expect(result[:employee_share]).to eq 581.30
        expect(result[:employer_share]).to eq 1_208.70
        expect(result[:total_share]).to eq 581.30 + 1_208.70
      end
    end

    context "with salary base of 100,000" do
      let!(:result) { subject.(100_000) }

      it "has correct amount of shares" do
        expect(result[:employee_share]).to eq 581.30
        expect(result[:employer_share]).to eq 1_208.70
        expect(result[:total_share]).to eq 581.30 + 1_208.70
      end
    end
  end
end
