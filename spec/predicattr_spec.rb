require 'spec_helper'
require 'predicattr'

describe Predicattr do

  class Thing
    include Predicattr
    
    
    attr_accessor :status
    
    attr_predicates :a, :b do |s|
      check_status(s)
    end
    
    def check_status(value)
      status == value.to_s
    end
    
    
    attr_accessor :mode
    
    attr_predicates c: 'see', d: 'dee' do |m|
      check_mode(m)
    end
    
    def check_mode(value)
      mode == value
    end
  end
  
  before do
    @thing = Thing.new
  end
  
  
  describe '#attr_predicates' do
    context 'given an array' do
      it 'defines methods for all predicate names' do
        @thing.should respond_to(:a?)
        @thing.should respond_to(:b?)
      end
      
      it 'defines its methods to invoke the given block, passing the appropriate predicate name' do
        @thing.should_receive(:check_status).once.with(:b)
        @thing.b?
      end
    end
    
    context 'given a hash' do
      it 'defines methods for all predicate names' do
        @thing.should respond_to(:c?)
        @thing.should respond_to(:d?)
      end
    
      it 'defines its methods to invoke the given block, passing the associated predicate value' do
        @thing.should_receive(:check_mode).once.with('dee')
        @thing.d?
      end
    end
  end

end