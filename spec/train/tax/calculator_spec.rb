RSpec.describe Train::Tax::Calculator do

  def withholding_tax(amount)
    Train::Tax::Calculator::WithholdingTax.(amount)
  end

  describe ".call" do
    context "20,833 and below" do
      it "has a net income = basic salary" do
        expect(subject.(20_000.00)[:net_income]).to eq 20_000.00
        expect(subject.(15_000.00)[:net_income]).to eq 15_000.00
        expect(subject.(5_000.00)[:net_income]).to eq 5_000.00
      end
    end

    context "a base salary of 30,000" do
      it "has a net income of (basic salary - withholding tax)" do
        salary = 30_000
        expect(subject.(salary)[:net_income]).to eq (salary - withholding_tax(salary))
      end
    end

    context "a base salary of 50,000" do
      it "has a net income of (basic salary - withholding tax)" do
        salary = 50_000
        expect(subject.(salary)[:net_income]).to eq (salary - withholding_tax(salary))
      end
    end

    context "a base salary of 100,000" do
      it "has a net income of (basic salary - withholding tax)" do
        salary = 100_000
        expect(subject.(salary)[:net_income]).to eq (salary - withholding_tax(salary))
      end
    end

    context "a base salary of 800,000" do
      it "has a net income of (basic salary - withholding tax)" do
        salary = 800_000
        expect(subject.(salary)[:net_income]).to eq (salary - withholding_tax(salary))
      end
    end
  end

end
