module Train::Tax::Calculator
  module Pagibig

    def self.call(salary)
      {
        employee_share: 100.00,
        employer_share: 100.00,
        total_share:    200.00,
      }
    end

  end
end
