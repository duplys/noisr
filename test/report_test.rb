#require 'report'
require 'test/unit'
require 'test/test_unit_extensions'

class ReportTest < Test::Unit::TestCase
#  def setup
#    @rp = Report.new('Test report')
#    @raw = [0.1,0.2,0.3,0.2,0.3,0.4]
#    @noisy = [0.11,0.18,0.33,0.16,0.27,0.45]
#  end
#
#  def teardown
#  end
   
#  must "plot the original signal and the noisy signal" do
#    @rp.raw = @raw
#    @rp.noisy = @noisy
#    @rp.plot('test/testplot')
#    assert_true( File.exists?('test/testplot_raw.svg') )
#    assert_true( File.exists?('test/testplot_noisy.svg') )
#  end
  
end 

#
#
#def plot(filename)
#  plotter.write(@raw, filename.to_s + '_raw.svg')
#  plotter.write(@noisy, filename.to_s + '_noisy.svg')
#end