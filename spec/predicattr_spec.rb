require 'spec_helper'
require 'predicattr'

describe Predicattr do

  class ThingWithStatus
    include Predicattr
    
    attr_accessor :status
    
    attr_predicates :a, :b do |s|
      check_status(s)
    end
    
    def check_status(value)
      status == value.to_s
    end
  end
  
  before do
    @thing = ThingWithStatus.new
  end
  
  
  describe '#attr_predicates' do
  
    it 'defines methods for all predicate names' do
      @thing.should respond_to(:a?)
      @thing.should respond_to(:b?)
    end
    
    it 'defines its methods to invoke the given block and pass the appropriate predicate name' do
      @thing.should_receive(:check_status).once.with(:b)
      @thing.b?
    end
  
  end

end