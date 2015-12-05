#!/usr/bin/env ruby

dir = File.dirname(File.expand_path(__FILE__))
$LOAD_PATH.unshift dir + "/../lib"

require 'periodic_pod'
require 'out_port'
require 'patterns'

def go
  parts = []
  
  parts << PeriodicPod.new([40], 5).each
  parts << PeriodicPod.new([47], 3).each
  parts << PeriodicPod.new(HARMONIC_MINOR.map {|n| n + 40 }, 7).each

  port = OutPort.new

  200.times do 
    parts.each {|p| p.next.run(port) }
    sleep(0.25)
  end
  
end


go

