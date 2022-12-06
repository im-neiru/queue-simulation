class Teller

    attr_reader :teller_name

    def initialize(teller_name)
        @teller_name = teller_name
        @busy = false
    end
  
    def busy?
        puts @teller_name
        @busy
    end
  
    def serve(customer)
        @busy = true
        puts "Customer " + customer.customer_num.to_s
        # simulate serving the customer by sleeping for a random amount of time
        sleep(rand)
        @busy = false
    end
end