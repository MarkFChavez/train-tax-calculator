module Train::Tax::Calculator
  module WithholdingTax

    LOOKUP_TABLE = [
      { lowest:       0.00, highest:  20_833.00, base:       0.00, excess: 0.00 },
      { lowest:  20_833.00, highest:  33_333.00, base:       0.00, excess: 0.20 },
      { lowest:  33_333.00, highest:  66_667.00, base:   2_500.00, excess: 0.25 },
      { lowest: 66_667.00, highest: 166_667.00, base:  10_833.33, excess: 0.30 },
      { lowest: 166_667.00, highest: 666_667.00, base:  40_833.33, excess: 0.32 },
      { lowest: 666_667.00, highest: Float::INFINITY, base: 200_833.33, excess: 0.35 },
    ]

    def self.compute(basic_salary)
      taxable_income = compute_taxable_income_for(basic_salary)
      tax_bracket = get_tax_bracket_for(taxable_income)
      withholding_tax = ((taxable_income - tax_bracket[:lowest]) * tax_bracket[:excess]) + tax_bracket[:base]

      withholding_tax.round(2)
    end

    private

      def self.compute_taxable_income_for(basic_salary)
        initial_net = basic_salary - Deductions.(basic_salary)

        if basic_salary > 90_000
          additional_tax = ((basic_salary - 90_000) / 12.00)
          return initial_net + additional_tax
        end

        initial_net
      end

      def self.get_tax_bracket_for(taxable_income)
        LOOKUP_TABLE.select do |bracket|
          taxable_income >= bracket[:lowest] &&
          taxable_income < bracket[:highest]
        end.first
      end

  end
end

