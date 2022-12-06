#queing simulation

require_relative 'models/teller.rb'
require_relative 'models/customer.rb'
require_relative 'models/dispatcher.rb'

customers = Array.new
TOTAL_CUSTOMER = 50
TOTAL_CUSTOMER_IN_LINE = 5


tellerA = Teller.new #1 minute
tellerB = Teller.new #2 minutes
tellerC = Teller.new #3 minutes

#this will determine the dificulty of the task
def taskLevel(time)
    rand(1..100) > 75 ? time * 2 : time
end

def fillAray
    for i in TOTAL_CUSTOMER
        customers.push(Customer.new(i))
    end
end

#so there are 5 people in every minute then i can choose their level of task then after than i need to put them to the line
#then i need to check if the teller is free then i need to serve them

(1..customers.size).each do |i|

    tellerA.add_to_queue(arr_customers[i])

    for x in taskLevel(1)
        
    end

    tellerB.add_to_queue(arr_customers[i])
    tellerC.add_to_queue(arr_customers[i])

    for x in 1..5 do
        if(tellerA.get_line_size < tellerB.get_line_size && tellerA.get_line_size < tellerC.get_line_size)
            tellerA.add_to_queue(arr_customers[i])
        elsif(tellerB.get_line_size < tellerA.get_line_size && tellerB.get_line_size < tellerC.get_line_size)
            tellerB.add_to_queue(arr_customers[i])
        elsif(tellerC.get_line_size < tellerA.get_line_size && tellerC.get_line_size < tellerB.get_line_size)
            tellerC.add_to_queue(arr_customers[i])
        end
    
    end

end


