#queing simulation
require_relative 'models/teller.rb'
require_relative 'models/customer.rb'
require_relative 'models/simulation.rb'

#customer task type
# 1x = normal
# 2x = heavy

#teller speed
# teller A = 1
# teller B = 2
# teller C = 3


sim = Simulation.new()
sim.process();

