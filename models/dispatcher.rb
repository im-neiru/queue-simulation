require_relative 'teller.rb'

class Dispatcher < Teller
    def initialize
        @tellers = []
    end
    
    def add_teller(teller)
        @tellers << teller
    end
    
    def dispatch
        @tellers.each do |teller|
            teller.serve
        end
    end
end