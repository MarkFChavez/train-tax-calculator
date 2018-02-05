# README: http://news.abs-cbn.com/pinoytaxreformcalculator
module Train::Tax::Calculator
  module Philhealth

    MULTIPLIER = 0.0275

    def self.compute(salary)
      if salary <= 10_000.00

        137.50

      elsif salary > 10_000.00 && salary <= 39_999.99

        ((salary * MULTIPLIER) / 2).round(2)

      elsif salary >= 40_000

        550.00

      end
    end

  end
end
