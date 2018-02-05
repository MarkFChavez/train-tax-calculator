module Train::Tax::Calculator
  module Philhealth

    LOOKUP_TABLE = {
      34_000.00 => 425.00,
      33_000.00 => 412.50,
      32_000.00 => 400.00,
      31_000.00 => 387.50,
      30_000.00 => 375.00,
      29_000.00 => 362.50,
      28_000.00 => 350.00,
      27_000.00 => 337.50,
      26_000.00 => 325.00,
      25_000.00 => 312.50,
      24_000.00 => 300.00,
      23_000.00 => 287.50,
      22_000.00 => 275.00,
      21_000.00 => 262.50,
      20_000.00 => 250.00,
      19_000.00 => 237.50,
      18_000.00 => 225.00,
      17_000.00 => 212.50,
      16_000.00 => 200.00,
      15_000.00 => 187.50,
      14_000.00 => 175.00,
      13_000.00 => 162.50,
      12_000.00 => 150.00,
      11_000.00 => 137.50,
      10_000.00 => 125.00,
      9_000.00  => 112.50,
      8_000.00  => 100.00,
      7_000.00  => 87.50,
      1.00      => 87.50
    }

    def self.compute(salary_base)
      result = 0.00
      return result if salary_base < 1.00

      LOOKUP_TABLE.each do |base, value|
        if salary_base >= base
          result = value
          break
        end
      end

      result
    end
  end
end
