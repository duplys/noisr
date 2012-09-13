require 'decibel'
require 'test/unit'
require 'test/test_unit_extensions'

class DecibelTest < Test::Unit::TestCase
  def setup
    @d = Decibel.new
  end
  
  def teardown
  end
  
  must "compute 20 log10 decibels" do
    assert_in_delta(30, @d.db20(31.62,1), 0.01)
    assert_in_delta(-80, @d.db20(0.001,10), 0.01)
  end
  
  must "compute 10 log10 decibels" do
    assert_in_delta(15, @d.db10(31.62,1), 0.01)
    assert_in_delta(-40, @d.db10(0.001,10), 0.01)
  end
  
  must "compute the signal amplitude for 20 log10 decibels" do
    assert_in_delta(31.62, @d.sig20(30, 1), 0.01)
    assert_in_delta(0.001, @d.sig20(-80, 10), 0.0001)
  end
  
  must "compute the signal amplitude for 10 log10 decibels" do
    assert_in_delta(31.62, @d.sig10(15, 1), 0.01)
    assert_in_delta(0.001, @d.sig10(-40, 10), 0.01)    
  end
  
  must "compute the reference amplitude for 20 log10 decibels" do
    assert_in_delta(1, @d.ref20(30, 31.62), 0.01)
    assert_in_delta(10, @d.ref20(-80, 0.001), 0.0001)
  end
  
  must "compute the reference amplitude for 10 log10 decibels" do
    assert_in_delta(1, @d.ref10(15, 31.62), 0.01)
    assert_in_delta(10, @d.ref10(-40, 0.001), 0.01)    
  end
end