RSpec.describe Train::Tax::Calculator::Philhealth do

  it "has a multiplier of 2.75%" do
    expect(subject::MULTIPLIER).to eq 0.0275
  end

  describe ".call" do
    context "with base salary of 16,500" do
      it "has an employee share of 226.88" do
        result = subject.(16_500)
        expect(result[:employee_share]).to eq 226.88
        expect(result[:employer_share]).to eq 226.88
        expect(result[:total_share]).to eq 226.88 * 2.0
      end
    end

    context "with base salary of 25,000" do
      it "has an employee share of 343.75" do
        result = subject.(25_000)
        expect(result[:employee_share]).to eq 343.75
        expect(result[:employer_share]).to eq 343.75
        expect(result[:total_share]).to eq 343.75 * 2.0
      end
    end

    context "with base salary of 150,000" do
      it "has an employee share of 550.00" do
        result = subject.(150_000)
        expect(result[:employee_share]).to eq 550.00
        expect(result[:employer_share]).to eq 550.00
        expect(result[:total_share]).to eq 550.00 * 2.0
      end
    end
  end

end
