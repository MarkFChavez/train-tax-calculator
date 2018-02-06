RSpec.describe Train::Tax::Calculator do

  PHILHEALTH = Train::Tax::Calculator::Philhealth
  PAGIBIG = Train::Tax::Calculator::Pagibig
  SSS = Train::Tax::Calculator::Sss

  let!(:basic_salary) { 15_000 }

  describe ".for_philhealth" do
    it "calls compute" do
      expect(PHILHEALTH).to receive(:compute).with(basic_salary)
      subject.for_philhealth(basic_salary)
    end
  end

  describe ".for_pagibig" do
    it "calls compute" do
      expect(PAGIBIG).to receive(:compute).with(basic_salary)
      subject.for_pagibig(basic_salary)
    end
  end

  describe ".for_sss" do
    it "calls compute" do
      expect(SSS).to receive(:compute).with(basic_salary)
      subject.for_sss(basic_salary)
    end
  end

  describe ".for_sss_es" do
    it "calls compute_employee_share" do
      expect(SSS).to receive(:compute_employee_share).with(basic_salary)
      subject.for_sss_es(basic_salary)
    end
  end

  describe ".for_sss_es" do
    it "calls compute_employer_share" do
      expect(SSS).to receive(:compute_employer_share).with(basic_salary)
      subject.for_sss_er(basic_salary)
    end
  end

end
