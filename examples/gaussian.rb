require 'Gaussian'
require 'rubygems'
require 'matrix'
require 'statsample'

raw = open('examples/signal.dat','r').readlines[600,200]
signal = Array.new
raw.each {|e| signal << e.to_f}
puts "raw signal size: " + signal.size.to_s

gaussian = Gaussian.new(signal)

noisy_signals = Array.new

20000.times do |i|
  noisy_signals << gaussian.add(-0.3)
  puts "Added #{i}-th noisy signal..."
end

m = Matrix[*noisy_signals]
puts m.column_size
puts m.row_size
  
avg_signal = Array.new
m.column_size.times do |col|
  column = m.column(col).to_a
  vec = column.to_vector(:scale) # statsample vector
  avg_signal << vec.mean
end

fd_noisy = open('examples/noisy_sig.dat','w+')
fd_avg = open('examples/avg_sig.dat','w+')

fd_noisy.puts m.row(0).to_a
fd_avg.puts avg_signal.to_a