require 'gaussian'
require 'report'
require 'rubygems'
require 'matrix'
require 'statsample'

raw = open('examples/signal.dat','r').readlines[600,200]
signal = Array.new
raw.each {|e| signal << e.to_f}
db = 20
  
gaussian = Gaussian.new(signal)
noisy = gaussian.add(20)

report = Report.new('Gaussian noise')
report.raw = raw
report.noisy = noisy
report.db = db
report.generate('examples/gaussian_report/')

