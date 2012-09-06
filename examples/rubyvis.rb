require 'rubyvis'

signal = open('examples/signal.dat','r').readlines

 data = pv.range(0, signal.size, 1).map {|x| 
   OpenStruct.new({:x=> x, :y=> signal[x].to_f}) #Math.sin(x) + 2+rand()})
 }

#p data
w = 1300
h = 600
x = pv.Scale.linear(data, lambda {|d| d.x}).range(0, w)


y = pv.Scale.linear(data, lambda {|d| d.y}).range(0, h);

#/* The root panel. */
vis = pv.Panel.new().width(w).height(h).bottom(20).left(20).right(20).top(20)

vis.add(pv.Line).data(data).line_width(1).left(lambda {|d| x.scale(d.x)}).bottom(lambda {|d| y.scale(d.y)}).anchor("bottom")#.add(pv.Line).line_width(1)
     

vis.render();

output = open('examples/rubyvis.svg','w')
output.puts vis.to_svg

output.close