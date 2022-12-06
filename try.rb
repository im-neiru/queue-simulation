# Set the initial values for the simulation
tellers = 3
time = 0
MAX_CUSTOMERS = 20

# Create a dictionary to hold the time each teller takes to serve a customer
teller_speeds = {
  "A" => 1,
  "B" => 2,
  "C" => 3
}

# Create a dictionary to hold the time multiplier for each type of task
task_multipliers = {
  "normal" => 1,
  "heavy" => 2
}

# Create a queue to hold the customers waiting to be served
queue = []

# Create a list to hold the amount of time each customer spends with each teller
times_spent_with_tellers = []

# Loop through the simulation until all customers have been served
while times_spent_with_tellers.length < MAX_CUSTOMERS
  # Check if any customers have arrived at the bank
  if time % 5 == 0
    # Randomly determine the number of customers who have arrived
    num_customers = rand(5) + 1

    # Randomly assign tasks to the customers
    num_customers.times do
      task = "normal"
      if rand < 0.15
        task = "heavy"
      end

      queue << {"time" => time, "task" => task}
    end
  end

  # Check if any tellers are free and if there are any customers waiting in line
  if queue.length > 0 && tellers > 0
    # If so, remove the next customer from the queue and calculate the amount of time they spend with a teller
    customer = queue.shift
    teller = teller_speeds.keys.sample
    puts 'teller ' + teller
    time_spent = time - customer["time"]
    time_multiplier = task_multipliers[customer["task"]]
    time_spent_with_teller = time_spent * time_multiplier
    puts 'time ' + time_spent_with_teller.to_s

    times_spent_with_tellers << time_spent_with_teller

  end

  # Increment the timer variable
  time += 1
end

# Print the amount of time each customer spent with a teller
# puts times_spent_with_tellers