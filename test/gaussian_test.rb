require 'gaussian'
require 'test/unit'
require 'test/test_unit_extensions'

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
  
  must "add Gaussian noise given a dB value" do
    expected = [0.1, 0.2, 0.3, 0.2, 0.3, 0.4]
    actual = @gs.add(40)
    6.times {|i| assert_in_delta(expected[i], actual[i], 0.1)}
  end
  
end