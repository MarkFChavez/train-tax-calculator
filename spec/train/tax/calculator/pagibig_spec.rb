RSpec.describe Train::Tax::Calculator::Pagibig do

  describe ".call" do
    it "returns 100.00 for everything" do
      result = subject.(10_000)

      expect(result[:employee_share]).to eq 100.00
      expect(result[:employer_share]).to eq 100.00
      expect(result[:total_share]).to eq 100.00 + 100.00

      result = subject.(100_000)

      expect(result[:employee_share]).to eq 100.00
      expect(result[:employer_share]).to eq 100.00
      expect(result[:total_share]).to eq 100.00 + 100.00
    end
  end

end
