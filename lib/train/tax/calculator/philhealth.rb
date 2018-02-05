module Train::Tax::Calculator
  module Philhealth

    LOOKUP_TABLE = {
      34_000.00 => { share: 425.00 },
      33_000.00 => { share: 412.50 },
      32_000.00 => { share: 400.00 },
      31_000.00 => { share: 387.50 },
      30_000.00 => { share: 375.00 },
      29_000.00 => { share: 362.50 },
      28_000.00 => { share: 350.00 },
      27_000.00 => { share: 337.50 },
      26_000.00 => { share: 325.00 },
      25_000.00 => { share: 312.50 },
      24_000.00 => { share: 300.00 },
      23_000.00 => { share: 287.50 },
      22_000.00 => { share: 275.00 },
      21_000.00 => { share: 262.50 },
      20_000.00 => { share: 250.00 },
      19_000.00 => { share: 237.50 },
      18_000.00 => { share: 225.00 },
      17_000.00 => { share: 212.50 },
      16_000.00 => { share: 200.00 },
      15_000.00 => { share: 187.50 },
      14_000.00 => { share: 175.00 },
      13_000.00 => { share: 162.50 },
      12_000.00 => { share: 150.00 },
      11_000.00 => { share: 137.50 },
      10_000.00 => { share: 125.00 },
      9_000.00  => { share: 112.50 },
      8_000.00  => { share: 100.00 },
      7_000.00  => { share: 87.50 },
      1.00      => { share: 87.50 },
    }

    def self.compute(salary_base)
      result = 0.00

      LOOKUP_TABLE.each do |base, data|
        if salary_base >= base
          result = data[:share]
          break
        end
      end

      result
    end
  end
end
