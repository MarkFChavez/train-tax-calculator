RSpec.describe Train::Tax::Calculator::Philhealth do

  describe ".compute" do
    context "salary base of 25_000" do
      it "has an employee share of 312.50" do
        expect(subject.compute(25_000)).to eq 312.50
      end
    end
  end

end
