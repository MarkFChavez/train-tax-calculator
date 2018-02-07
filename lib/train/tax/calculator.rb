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

      # TODO: Move this data somewhere
      TRAIN_TAX_TABLE = [
        { lowest:       0.00, highest:  20_833.00, base:       0.00, excess: 0.00 },
        { lowest:  20_833.00, highest:  33_333.00, base:       0.00, excess: 0.20 },
        { lowest:  33_333.00, highest:  66_667.00, base:   2_500.00, excess: 0.25 },
        { lowest: 66_667.000, highest: 166_667.00, base:  10_833.33, excess: 0.30 },
        { lowest: 166_667.00, highest: 666_667.00, base:  40_833.33, excess: 0.32 },
        { lowest: 666_667.00, highest: +1.00/0.00, base: 200_833.33, excess: 0.35 },
      ]

      class << self

        def withholding_tax(deductions, basic_salary)
          taxable_income = basic_salary - deductions
          compute_withholding_for(taxable_income).round(2)
        end

        def compute_withholding_for(income)
          tax_bracket = TRAIN_TAX_TABLE.select do |bracket|
            income >= bracket[:lowest] && 
            income < bracket[:highest]
          end.first

          tax_bracket[:base] + ((income - tax_bracket[:lowest]) * tax_bracket[:excess])
        end

      end
    end
  end
end
