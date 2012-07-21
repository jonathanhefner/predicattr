require "predicattr/version"

module Predicattr

  def self.included(base)
    base.extend(ClassMethods)
  end
  
  
  module ClassMethods
  
    def attr_predicates(*args, &block)
      args.inject([]) do |ary, arg|
        if arg.is_a?(Hash) || arg.is_a?(Array)
          ary += arg.to_a
        else
          ary << arg
        end
      end.each do |arg|
        predicate, value = arg.is_a?(Array) ? arg : [arg, arg]
        
        define_method :"#{predicate}?" do
          instance_exec(value, &block)
        end
      end
    end
    
  end

end
