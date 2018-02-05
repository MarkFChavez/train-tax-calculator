RSpec.describe Train::Tax::Calculator::Sss do

  describe ".compute" do
    
    context "with salary base of 15,000" do
      it "has an employee share of 545.00" do
        expect(subject.compute_employee_share(15_000)).to eq 545.00
      end

      it "has an employer share of 1,135.00" do
        expect(subject.compute_employer_share(15_000)).to eq 1_135.00
      end
    end

    context "with salary base of 25,000" do
      it "has an employee share of 581.30" do
        expect(subject.compute_employee_share(25_000)).to eq 581.30
      end

      it "has an employer share of 1,208.70" do
        expect(subject.compute_employer_share(25_000)).to eq 1_208.70
      end
    end

    context "with salary base of 50,000" do
      it "has an employee share of 581.30" do
        expect(subject.compute_employee_share(50_000)).to eq 581.30
      end

      it "has an employer share of 1,208.70" do
        expect(subject.compute_employer_share(50_000)).to eq 1_208.70
      end
    end

    context "with salary base of 80,000" do
      it "has an employee share of 581.30" do
        expect(subject.compute_employee_share(80_000)).to eq 581.30
      end

      it "has an employer share of 1,208.70" do
        expect(subject.compute_employer_share(80_000)).to eq 1_208.70
      end
    end

    context "with salary base of 100,000" do
      it "has an employee share of 581.30" do
        expect(subject.compute_employee_share(100_000)).to eq 581.30
      end

      it "has an employer share of 1,208.70" do
        expect(subject.compute_employer_share(100_000)).to eq 1_208.70
      end
    end

  end

end
