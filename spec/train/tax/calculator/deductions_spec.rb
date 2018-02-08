RSpec.describe Train::Tax::Calculator::Deductions do

  let!(:klass) { Train::Tax::Calculator::Deductions }
  
  describe ".get" do
    context "with basic salary of 15,000" do
      it "has a total deduction of 851.25" do
        expect(klass.compute(15_000)).to eq 851.25
      end
    end

    context "with basic salary of 30,000" do
      it "has a total deduction of 1,093.80" do
        expect(klass.compute(30_000)).to eq 1093.80
      end
    end

    context "with basic salary of 75,000" do
      it "has a total deduction of 1,231.30" do
        expect(klass.compute(75_000)).to eq 1231.30
      end
    end

    context "with basic salary of 500,000" do
      it "has a total deduction of 1,231.30" do
        expect(klass.compute(500_000)).to eq 1231.30
      end
    end
  end

end

