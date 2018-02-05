require "train/tax/calculator/version"
require "train/tax/calculator/philhealth"
require "train/tax/calculator/pagibig"

module Train
  module Tax
    module Calculator
      def self.monthly(salary_base)
        3_000
      end

      def self.for_philhealth(salary_base)
        Philhealth.compute(salary_base)
      end
    end
  end
end
