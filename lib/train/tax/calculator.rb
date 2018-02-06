require "train/tax/calculator/version"
require "train/tax/calculator/philhealth"
require "train/tax/calculator/pagibig"
require "train/tax/calculator/sss"

module Train
  module Tax
    module Calculator

      def self.call(basic_salary)
        hash = Hash.new

        hash[:sss] = for_sss_es(basic_salary)
        hash[:philhealth] = for_philhealth(basic_salary)
        hash[:pagibig] = for_pagibig(basic_salary)
        hash[:total_deductions] = hash[:sss] + hash[:philhealth] + hash[:pagibig]
        hash[:withholding_tax] = withholding_tax(basic_salary)
        hash[:net_income] = net_income(basic_salary)

        hash
      end

      private

      HIGHEST_BRACKET = 666_667.00
      HIGHER_BRACKET  = 166_667.00
      HIGH_BRACKET    = 66_667.00
      LOW_BRACKET     = 33_333.00
      LOWEST_BRACKET  = 20_833.00

      class << self

        def withholding_tax(basic_salary)
          deductions = for_philhealth(basic_salary) + for_pagibig(basic_salary) + for_sss_es(basic_salary)
          taxable_income = basic_salary - deductions

          compute_withholding_for(taxable_income).round(2)
        end

        def net_income(basic_salary)
          basic_salary - withholding_tax(basic_salary)
        end
        
        def compute_withholding_for(income)
          if income >= HIGHEST_BRACKET

            200_833.33 + ((income - HIGHEST_BRACKET) * 0.35)

          elsif income >= HIGHER_BRACKET

            40_833.33 + ((income - HIGHER_BRACKET) * 0.32)

          elsif income >= HIGH_BRACKET

            10_833.33 + ((income - HIGH_BRACKET) * 0.30)

          elsif income >= LOW_BRACKET

            2_500.00 + ((income - LOW_BRACKET) * 0.25)

          elsif income >= LOWEST_BRACKET

            0.00 + ((income - LOWEST_BRACKET) * 0.20)

          else

            0.00

          end
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

    end
  end
end
