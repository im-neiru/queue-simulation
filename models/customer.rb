class Customer

    attr_reader :customer_num
    attr_reader :random_task_value

    $TASK_TYPE = {"normal" => 1, "heavy" => 2}

    def initialize (customer_num)
        #will set the name of the customer
        @random_task_value  = self.rand_task_type
        @customer_num = customer_num
    end

    #will return the task type of the customer
    def rand_task_type
        if rand <= 0.15
            $TASK_TYPE["heavy"]
        end
    
        $TASK_TYPE["normal"]
    end
end