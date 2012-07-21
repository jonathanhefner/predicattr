require "predicattr/version"

module Predicattr

  def self.included(base)
    base.extend(ClassMethods)
  end
  
  
  module ClassMethods
  
    def attr_predicates(*args, &block)
      args.flatten.each do |p|
        method_name = :"#{p}?"
        
        define_method method_name do
          instance_exec(p, &block)
        end
      end
    end
    
  end

end
