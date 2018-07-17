module Train
  module Tax
    module Calculator
      class Deductions

        def self.call(salary)
          Sss.(salary)[:employee_share] +
            Pagibig.(salary)[:employee_share] +
            Philhealth.(salary)[:employee_share]
        end

      end
    end
  end
end
