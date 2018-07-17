module Train
  module Tax
    module Calculator
      class Deductions

        def self.compute(basic_salary)
          new(basic_salary).compute
        end

        def initialize(basic_salary)
          @basic_salary = basic_salary
        end

        def compute
          sss + pagibig + philhealth
        end

        private

        def sss
          Sss.(@basic_salary)[:employee_share]
        end

        def pagibig
          Pagibig.(@basic_salary)[:employee_share]
        end

        def philhealth
          Philhealth.compute(@basic_salary)
        end

      end
    end
  end
end
