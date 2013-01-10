# Defines a conversion protocol for BigDecimal that is
# (a) easier to type than { BigDecimal(something.to_s), and
# (b) idempotent by virtue of being lazy

class Object
  def to_bd
    BigDecimal.new(self.to_s.gsub(/[^\d\.]/, ''))
  end
end

class BigDecimal
  def to_bd
    self
  end
end
