module Train::Tax::Calculator
  module Sss

    TABLE = {
      15_750.00 => { er: 1_208.70, ee: 581.30 },
      15_250.00 => { er: 1_171.80, ee: 563.20 },
      14_750.00 => { er: 1_135.00, ee: 545.00 },
      14_250.00 => { er: 1_078.20, ee: 526.80 },
      13_750.00 => { er: 1_041.30, ee: 508.70 },
      13_250.00 => { er: 1_004.50, ee: 490.50 },
      12_750.00 => { er: 967.70, ee: 472.30 },
      12_250.00 => { er: 930.80, ee: 454.20 },
      11_750.00 => { er: 894.00, ee: 436.00 },
      11_250.00 => { er: 857.20, ee: 417.80 },
      10_750.00 => { er: 820.30, ee: 399.70 },
      10_250.00 => { er: 783.50, ee: 381.50 },
      9_750.00  => { er: 746.70, ee: 363.30 },
      9_250.00  => { er: 709.80, ee: 345.20 },
      8_750.00  => { er: 673.00, ee: 327.00 },
      8_250.00  => { er: 636.20, ee: 308.80 },
      7_750.00  => { er: 599.30, ee: 290.70 },
      7_250.00  => { er: 562.50, ee: 272.50 },
      6_750.00  => { er: 525.70, ee: 254.30 },
      6_250.00  => { er: 488.80, ee: 236.20 },
      5_750.00  => { er: 452.00, ee: 218.00 },
      5_250.00  => { er: 415.20, ee: 199.80 },
      4_750.00  => { er: 378.30, ee: 181.70 },
      4_250.00  => { er: 341.50, ee: 163.50 },
      3_750.00  => { er: 304.70, ee: 145.30 },
      3_250.00  => { er: 267.80, ee: 127.20 },
      2_750.00  => { er: 231.00, ee: 109.00 },
      2_250.00  => { er: 194.20, ee: 90.80 },
      1_750.00  => { er: 157.30, ee: 72.70 },
      1_250.00  => { er: 120.50, ee: 54.50 },
      1_000.00  => { er: 83.70, ee: 36.30 },
    }

    def self.call(salary)
      {
        employee_share: employee_share(salary),
        employer_share: employer_share(salary),
        total_share: total_share(salary),
      }
    end

    private

    def self.employer_share(salary)
      compute(salary)[:er]
    end

    def self.employee_share(salary)
      compute(salary)[:ee]
    end

    def self.total_share(salary)
      employer_share(salary) + employee_share(salary)
    end

    def self.compute(salary)
      result = 0.00

      TABLE.each do |base, data|
        if salary >= base
          result = data
          break
        end
      end

      result
    end

  end
end
