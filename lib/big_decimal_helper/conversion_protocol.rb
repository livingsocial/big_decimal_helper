# Defines a conversion protocol for BigDecimal that is
# (a) easier to type than { BigDecimal(something.to_s), and
# (b) idempotent by virtue of being lazy
# (c) restricted to a few known types

module BigDecimalHelper
  module ConversionProtocol
    module Self
      def to_bd
        self
      end
    end

    module ViaStringRepresentation
      def to_bd
        string_representation = to_s.gsub(/[^\-\d\.]/, '')
        BigDecimal.new(string_representation)
      end
    end
  end
end

BigDecimal.send :include, BigDecimalHelper::ConversionProtocol::Self
Object    .send :include, BigDecimalHelper::ConversionProtocol::ViaStringRepresentation
