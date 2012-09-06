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
    raise ArgumentError, 'db must be negative' unless db < 0
    
    noisy = Array.new
    # TODO to compute the 'noise' v0, you have to take something like the standard deviation of the 
    # signal's amplitude. @mean is the absolute voltage value and way to high for computing the noise!
    v0 = @dcb.ref20(db, 0.01)
    puts @peak2peak
    puts v0
    puts ''
        
    @raw.each do |e|
      puts rand*v0
      noisy << (e + rand*v0 - rand*v0 + rand*v0 - rand*v0 + rand*v0 - rand*v0 + rand*v0 - rand*v0 + rand*v0 - rand*v0 + rand*v0 - rand*v0 + rand*v0 - rand*v0 + rand*v0 - rand*v0 + rand*v0 - rand*v0 + rand*v0 - rand*v0 + rand*v0 - rand*v0 + rand*v0 - rand*v0 + rand*v0 - rand*v0 + rand*v0 - rand*v0 + rand*v0 - rand*v0 + rand*v0 - rand*v0)
    end
    
    return noisy
  end
  
end