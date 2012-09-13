require 'report'
require 'test/unit'
require 'test/test_unit_extensions'

class ReportTest < Test::Unit::TestCase
  def setup
    @rp = Report.new('Test report')
    @rp.raw = [0.1,0.2,0.3,0.2,0.3,0.4]
    @rp.noisy = [0.11,0.18,0.33,0.16,0.27,0.45]
    @rp.db = 40
  end

  def teardown
  end
   
  must "generate an html report showing the original and the noisy signals" do
    @rp.generate('test/testplot/')
    assert_true( File.exists?('test/testplot/report.html') )
  end
  
end 