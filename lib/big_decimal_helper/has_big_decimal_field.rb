module BigDecimalHelper
  # Provides an ActiveRecord macro to coerce fields to BigDecimal
  module HasBigDecimalField
    def has_big_decimal_field(attr_name)
      composed_of attr_name,
        :class_name  => 'BigDecimal',
        :mapping     => [ [attr_name, :to_f] ],
        :constructor => Proc.new {|x| x.to_bd },
        :converter   => Proc.new {|x| x.to_bd }
    end
  end

  def self.add_active_record_macro!
    return unless defined?( ActiveRecord::Base )
    return if ActiveRecord::Base.kind_of?( BigDecimalHelper::HasBigDecimalField )
    ActiveRecord::Base.send :extend, BigDecimalHelper::HasBigDecimalField
  end
end

BigDecimalHelper.add_active_record_macro!
