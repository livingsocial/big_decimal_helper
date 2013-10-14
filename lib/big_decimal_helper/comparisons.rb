module BigDecimalHelper
  module Comparisons
    def max_of(list)
      sanitize_list_for_comparison(list).max
    end

    def min_of(list)
      sanitize_list_for_comparison(list).min
    end

    private

    def sanitize_list_for_comparison(list)
      list \
        .map(&:to_bd) \
        .reject(&:nan?)
    end
  end

  extend Comparisons
end
