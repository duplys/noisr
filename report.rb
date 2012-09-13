require 'rubyvis'
require 'fileutils'

# Class for generating a report on the raw signal and the noisy signal

class Report
  attr_accessor :raw, :noisy, :db
  
  def initialize(title)
    @title = title
    @width = 1200
    @height = 200 # 600
  end
  
    
  # Takes a path. Renders raw and noisy signals and stores them as .svg files
  #   rp = Report.new('Test report')
  #   rp.raw = [0.1,0.2,0.3,0.2,0.3,0.4]
  #   rp.noisy = [0.11,0.18,0.33,0.16,0.27,0.45]
  #   rp.db = 40
  #   rp.generate('test/testplot/')                                         # =>  'test/testplot.html'
  def generate(path)
    self.check_arguments
    FileUtils.mkdir(path) unless File.exists?(path)
    self.plot_signal(@raw, path + 'raw')
    self.plot_signal(@noisy, path + 'noisy')
    self.generate_html(path)
  end
  
  
  # private method
  def check_arguments
    raise "assign the raw signal first" unless @raw != nil
    raise "assign the noisy signal first" unless @noisy != nil
    raise "assign the db value first" unless @db != nil
  end
  
  
  # private method
  def plot_signal(signal, path_and_filename)
    sig = pv.range(0, signal.size, 1).map {|x| OpenStruct.new({:x=> x, :y=> signal[x].to_f}) }
    
      puts signal.min.to_f
      
    vis = pv.Panel.new().width(@width).height(@height).bottom(20).left(40).right(20).top(20)
  
    x = pv.Scale.linear(sig, lambda {|d| d.x}).range(0, @width)
    y = pv.Scale.linear(sig, lambda {|d| d.y}).range(0, @height)

      
    # Y-axis and ticks. 
    vis.add(pv.Rule).data(y.ticks()).bottom(y).strokeStyle(lambda {|d| d!=0 ? "#eee" : "#000"}).anchor("left").add(pv.Label).visible(lambda {|d|  d > signal.min.to_f and d < signal.max.to_f}).text(y.tick_format)
  
    # X-axis and ticks. 
    vis.add(pv.Rule).data(x.ticks()).left(x).stroke_style(lambda {|d| d!=0 ? "#eee" : "#000"}).anchor("bottom").add(pv.Label).visible(lambda {|d|  d > 0 and d < signal.size}).text(x.tick_format)
        
    vis.add(pv.Line).data(sig).line_width(1).left(lambda {|d| x.scale(d.x)}).bottom(lambda {|d| y.scale(d.y)}).anchor("bottom")#.add(pv.Line).line_width(1)
    vis.render();
  
    output = open(path_and_filename + '.svg','w')
    output.puts vis.to_svg
    output.close
  end
  
  
  # private method
  def generate_html(path)
    file = open(path + 'report.html','w')
    file.puts "<html>"
    file.puts "<h2><font color=\"#0033CC\">noisr report: #{@title}, #{@db} dB</font></h2>"
    file.puts "<br>"
    file.puts "<h3><font color=\"#0033CC\"><em>raw signal</em></font></h3>"
    file.puts "<IMG SRC=\"raw.svg\">"
    file.puts "<br>"
    file.puts "<h3><font color=\"#0033CC\"><em>noisy signal</em></font></h3>"
    file.puts "<IMG SRC=\"noisy.svg\">"
    file.puts "</html>"
  end
end