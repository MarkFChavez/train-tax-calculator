module Train::Tax::Calculator
  module Philhealth

    # 2.75%
    MULTIPLIER = 0.0275

    def self.call(salary)
      contribution = compute(salary)

      {
        employee_share: contribution,
        employer_share: contribution,
        total_share: contribution * 2.0,
      }
    end

    private

    def self.compute(salary)
      if salary <= 10_000.00
        137.50
      elsif salary <= 39_999.99
        ((salary * MULTIPLIER) / 2).round(2)
      else
        550.00
      end
    end

  end
end
