require 'rubygems'
require 'statsample'
require 'Decibel'

# Class for adding Gaussian noise to a raw signal

class Gaussian
  attr_reader :raw
  
  # Takes raw signal. Converts to vector and precomputes the signal's mean (statsample).
  #   gs = Gaussian.new([0.1,0.2,0.3,0.2,0.3,0.4])
  #   gs.raw                                           # =>  [0.1,0.2,0.3,0.2,0.3,0.4]
  #   gs.mean                                          # =>  0.25
  def initialize(signal)
    @raw = signal.to_vector(:scale)
    @peak2peak = @raw.max - @raw.min
    @dcb = Decibel.new
  end
  
  def add(db)
    noisy = Array.new
    v0 = @dcb.ref20(db, @peak2peak)
    puts @peak2peak
    puts v0
    puts ''
        
    @raw.each do |e|
      noisy << (e + rand*v0 - rand*v0 + rand*v0 - rand*v0 + rand*v0 - rand*v0 + rand*v0 - rand*v0 + rand*v0 - rand*v0 + rand*v0 - rand*v0 + rand*v0 - rand*v0 + rand*v0 - rand*v0 + rand*v0 - rand*v0 + rand*v0 - rand*v0 + rand*v0 - rand*v0 + rand*v0 - rand*v0 + rand*v0 - rand*v0 + rand*v0 - rand*v0 + rand*v0 - rand*v0 + rand*v0 - rand*v0)
    end
    
    return noisy
  end
  
end