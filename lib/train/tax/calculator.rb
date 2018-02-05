require "train/tax/calculator/version"
require "train/tax/calculator/philhealth"
require "train/tax/calculator/pagibig"
require "train/tax/calculator/sss"

module Train
  module Tax
    module Calculator

      def self.net_taxable_income(salary_base)
        deductions = for_philhealth(salary_base) + for_pagibig(salary_base) + for_sss_es(salary_base)
        (salary_base - deductions).round(2)
      end

      def self.for_philhealth(salary_base)
        Philhealth.compute(salary_base)
      end

      def self.for_pagibig(salary_base)
        Pagibig.compute(salary_base)
      end

      def self.for_sss(salary_base)
        Sss.compute(salary_base)
      end

      def self.for_sss_es(salary_base)
        Sss.compute_employee_share(salary_base)
      end

      def self.for_sss_er(salary_base)
        Sss.compute_employer_share(salary_base)
      end

    end
  end
end
