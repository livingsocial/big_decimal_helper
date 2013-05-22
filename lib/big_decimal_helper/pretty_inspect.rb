# Provide a notation that confirms that the proper class is being used,
# but which a normal human can actually read.

class BigDecimal
  def inspect
    # Sign
    sign = self < 0 ? '-' : ''

    # Math
    integer  = self > 0 ? floor.to_i : ceil.to_i
    fraction = (self - integer).abs

    # Commas
    int_part = integer \
      .abs \
      .to_s \
      .reverse \
      .scan(/(?:\.)?\d{1,3}-?/) \
      .join(',') \
      .reverse

    # Trailing decimals, if any
    dec_part = \
      if fraction.zero?
        ''
      else
        fraction.to_s \
          .gsub(/^0/, '') \
          .gsub(/E\d+$/, '')
      end

    # Template
    '#<BigDecimal: %s>' % [ sign, int_part, dec_part ].join
  end
end
