require 'Gaussian'
require 'test/unit'
require 'test/TestUnitExtensions'

class GaussianTest < Test::Unit::TestCase
  def setup
    @raw = [0.1,0.2,0.3,0.2,0.3,0.4]
    @gs = Gaussian.new(@raw)
  end
  
  def teardown
  end
  
  must "store the raw signal upon instantiation" do
    assert_in_delta(@raw[0], @gs.raw[0], 0.01)
  end
  
  must "add Gaussian noise given a negative dB" do
    expected = [0.1, 0.2, 0.3, 0.2, 0.3, 0.4]
    actual = @gs.add(-1)
    6.times {|i| assert_in_delta(expected[i], actual[i], 0.1)}
    flunk
  end
  
  must "raise an exception when given a positive dB" do
    assert_raise do 
        @gs.add(2)
    end 
  end
  
end