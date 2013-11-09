require 'bigdecimal'

module BigDecimalHelper
end

require 'pathname'
lib_path = File.expand_path(File.join(File.dirname(__FILE__), 'big_decimal_helper' ))
lib_path = Pathname.new( lib_path )

require lib_path.join( 'version' )
require lib_path.join( 'conversion_protocol' )
require lib_path.join( 'pretty_inspect' )
require lib_path.join( 'has_big_decimal_field' )
require lib_path.join( 'comparisons' )

