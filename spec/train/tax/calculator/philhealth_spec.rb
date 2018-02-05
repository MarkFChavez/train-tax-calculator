RSpec.describe Train::Tax::Calculator::Philhealth do

  describe ".compute" do
    it "has a multiplier of 2.75%" do
      expect(subject::MULTIPLIER).to eq 0.0275
    end

    context "with base salary of 16,500" do
      it "has an employee share of 226.88" do
        expect(subject.compute(16_500)).to eq 226.88
      end
    end

    context "with base salary of 25,000" do
      it "has an employee share of 343.75" do
        expect(subject.compute(25_000)).to eq 343.75
      end
    end

    context "with base salary of 150,000" do
      it "has an employee share of 550.00" do
        expect(subject.compute(150_000)).to eq 550.00
      end
    end
  end

end
