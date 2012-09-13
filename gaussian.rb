require 'rubygems'
require 'statsample'
require 'decibel'

# Class for adding Gaussian noise to a raw signal

class Gaussian
  attr_accessor :raw
  
  # Takes a raw signal, converts it to a vector and stores it in the instance variable @raw.
  #   gs = Gaussian.new([0.1,0.2,0.3,0.2,0.3,0.4])
  #   gs.raw                                           # =>  [0.1,0.2,0.3,0.2,0.3,0.4]
  def initialize(signal)
    @raw = signal.to_vector(:scale)
    @dcb = Decibel.new
  end
  
  # Takes a dB value. Adds Gaussian noise to the raw signal according to the given dB value.
  #   gs = Gaussian.new([0.1,0.2,0.3,0.2,0.3,0.4])
  #   gs.add(40)                             # =>  [0.106, 0.192, 0.290, 0.196, 0.296, 0.405]
  def add(db)
    noisy = Array.new
    @peak2peak = @raw.max - @raw.min
    v0 = @dcb.ref20(db, @peak2peak)
        
    @raw.each do |e|
      noisy << (e + rand*v0 - rand*v0 + rand*v0 - rand*v0 + rand*v0 - rand*v0 + rand*v0 - rand*v0 + rand*v0 - rand*v0 + rand*v0 - rand*v0 + rand*v0 - rand*v0 + rand*v0 - rand*v0 + rand*v0 - rand*v0 + rand*v0 - rand*v0 + rand*v0 - rand*v0 + rand*v0 - rand*v0 + rand*v0 - rand*v0 + rand*v0 - rand*v0 + rand*v0 - rand*v0 + rand*v0 - rand*v0)
    end
    
    return noisy
  end
  
end