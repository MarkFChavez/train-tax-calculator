require "train/tax/calculator/version"
require "train/tax/calculator/philhealth"
require "train/tax/calculator/pagibig"
require "train/tax/calculator/sss"

module Train
  module Tax
    module Calculator

      class << self

        def withholding_tax(basic_salary)
          deductions = for_philhealth(basic_salary) + for_pagibig(basic_salary) + for_sss_es(basic_salary)
          taxable_income = basic_salary - deductions

          compute_withholding_for(taxable_income).round(2)
        end

        def net_income(basic_salary)
          basic_salary - withholding_tax(basic_salary)
        end

        def for_philhealth(basic_salary)
          Philhealth.compute(basic_salary)
        end

        def for_pagibig(basic_salary)
          Pagibig.compute(basic_salary)
        end

        def for_sss(basic_salary)
          Sss.compute(basic_salary)
        end

        def for_sss_es(basic_salary)
          Sss.compute_employee_share(basic_salary)
        end

        def for_sss_er(basic_salary)
          Sss.compute_employer_share(basic_salary)
        end

      end

      private

      def self.compute_withholding_for(income)
        if income >= 666_667.00

          200_833.33 + ((income - 666_667.00) * 0.35)

        elsif income >= 166_667.00

          40_833.33 + ((income - 166_667.00) * 0.32)

        elsif income >= 66_667.00

          10_833.33 + ((income - 66_667.00) * 0.30)

        elsif income >= 33_333.00

          2_500.00 + ((income - 33_333.00) * 0.25)

        elsif income >= 20_833.00

          0.00 + ((income - 20_833.00) * 0.20)

        else

          0.00

        end
      end

    end
  end
end
