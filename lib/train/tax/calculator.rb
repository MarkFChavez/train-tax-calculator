require "train/tax/calculator/version"
require "train/tax/calculator/philhealth"
require "train/tax/calculator/pagibig"
require "train/tax/calculator/sss"

module Train
  module Tax
    module Calculator

      def self.withholding_tax(basic_salary)
      end

      def self.for_philhealth(basic_salary)
        Philhealth.compute(basic_salary)
      end

      def self.for_pagibig(basic_salary)
        Pagibig.compute(basic_salary)
      end

      def self.for_sss(basic_salary)
        Sss.compute(basic_salary)
      end

      def self.for_sss_es(basic_salary)
        Sss.compute_employee_share(basic_salary)
      end

      def self.for_sss_er(basic_salary)
        Sss.compute_employer_share(basic_salary)
      end

    end
  end
end
