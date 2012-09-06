# Class for computing decibels and converting decibels into amplitudes

class Decibel
  def initialize
  end
  
  # Takes amplitude v1 and a reference amplitude v0. Return decibels for squared amplitudes.
  #   db20(31.62, 1)                                # =>  30
  #   db20(0.001, 10)                               # => -80
  def db10(v1,v0)
    10 * Math::log10(v1/v0.to_f)
  end
  
  # Takes power p1 and a reference power p0. Return decibels.
  #   db10(31.62, 1)                                # =>  15
  #   db10(0.001, 10)                               # => -40
  def db20(p1,p0)
    20 * Math::log10(p1/p0.to_f)    
  end
  
  # Takes decibels db and a reference amplitude v0. Returns amplitude v1.
  #   sig20(30, 1)                                  # =>  31.62
  #   sig20(-80, 10)                                # =>  0.001
  def sig20(db,v0)
    (10**(db/20.0)) * v0
  end
  
  # Takes decibels db and a reference power p0. Returns power p1.
  #   sig10(15, 1)                                  # =>  31.62
  #   sig10(-40, 10)                                # =>  0.001
  def sig10(db,p0)
    (10**(db/10.0)) * p0
  end
  
  # Takes decibels db and the signal amplitude v1. Returns the reference amplitude v0.
  #   sig20(30, 31.62)                              # =>  1
  #   sig20(-80, 0.001)                             # =>  10
  def ref20(db,v1)
    v1.to_f / (10**(db/20.0)) 
  end
  
  # Takes decibels db and the signal power p1. Returns the reference power p0.
  #   sig10(15, 31.62)                              # =>  1
  #   sig10(-40, 0.001)                             # =>  10
  def ref10(db,p1)
    p1.to_f / (10**(db/10.0)) 
  end
end