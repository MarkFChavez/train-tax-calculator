module Train
  module Tax
    module Calculator
      class Deductions

        def self.get(basic_salary)
          new(basic_salary).get
        end

        def initialize(basic_salary)
          @basic_salary = basic_salary
        end

        def get
          sss + pagibig + philhealth
        end

        private

        def sss
          Sss.compute_employee_share(@basic_salary)
        end

        def pagibig
          Pagibig.compute(@basic_salary)
        end

        def philhealth
          Philhealth.compute(@basic_salary)
        end

      end
    end
  end
end
