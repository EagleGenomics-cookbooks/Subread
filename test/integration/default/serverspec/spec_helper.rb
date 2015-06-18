class PseudoNode
  attr_accessor :default
 
  class MyHash < Hash
    alias_method :orig_subscript, :'[]'
    define_method(:'[]') do |subscript|
      send(:'[]=', subscript, MyHash.new) unless orig_subscript(subscript)
      orig_subscript(subscript)
    end
  end
  
  def initialize config_path='/tmp/default_attributes.rb'  
    puts "initializing in #{Dir.pwd}"
    
    default = node = override = MyHash.new

    eval IO.read(config_path)
    
    @default = default
  end
  # default hash has all the values now.
end
