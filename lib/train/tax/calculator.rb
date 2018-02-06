require "train/tax/calculator/version"
require "train/tax/calculator/philhealth"
require "train/tax/calculator/pagibig"
require "train/tax/calculator/sss"
require "train/tax/calculator/deductions"

module Train
  module Tax
    module Calculator

      def self.call(basic_salary)
        hash = Hash.new

        hash[:sss]              = Sss.compute_employee_share(basic_salary)
        hash[:pagibig]          = Pagibig.compute(basic_salary)
        hash[:philhealth]       = Philhealth.compute(basic_salary)
        hash[:total_deductions] = Deductions.get(basic_salary)
        hash[:withholding_tax]  = withholding_tax(hash[:total_deductions], basic_salary)
        hash[:net_income]       = basic_salary - hash[:withholding_tax]

        hash
      end

      private

      HIGHEST_BRACKET = 666_667.00
      HIGHER_BRACKET  = 166_667.00
      HIGH_BRACKET    = 66_667.00
      LOW_BRACKET     = 33_333.00
      LOWEST_BRACKET  = 20_833.00

      class << self

        def withholding_tax(deductions, basic_salary)
          taxable_income = basic_salary - deductions
          compute_withholding_for(taxable_income).round(2)
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

      end
    end
  end
end
