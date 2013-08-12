# Provide a notation that confirms that the proper class is being used,
# but which a normal human can actually read.

class BigDecimal
  def inspect
    BigDecimalHelper.pretty_inspect(self)
  end
end


module BigDecimalHelper
  def self.pretty_inspect(bd)
    "#<BigDecimal: #{string_for_pretty_inspect(bd)}>"
  end

  private

  def self.string_for_pretty_inspect(bd)

    # Lean on the Float class for basic formatting, but drop the trailing '.0'
    s = bd.to_f.to_s.gsub(/\.0$/, '')

    # Add commas to the integer part
    int_part, dec_part = s.split('.')
    int_part = int_part \
      .to_s \
      .reverse \
      .scan(/(?:\.)?\d{1,3}-?/) \
      .join(',') \
      .reverse

    # Put it all back together
    dec_part = '.' + dec_part unless dec_part.nil?
    [ int_part, dec_part ].join
  end
end

