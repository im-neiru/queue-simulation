# queue-simulation

# Problem

There is a local processing system in your nearby area that has 3 tellers, and everyone falls in line for each teller. Curious, you thought. You briefly asked the manager if each teller performs the same tasks as the other. They responded with a Yes. So, you thought their system can be further optimized, but you need proof of concept.

# Task

Write a simulation program for two scenarios, namely Scenario A being the old and current system, and Scenario B being the new optimized system. From observation, each teller has different performance outputs, but these can be defined as skill levels 1, 2 and 3, them being defined as poor, average and excellent respectively. Teller A has an excellent performance, Teller B has an average performance and Teller C has a poor performance. For the program, one can objectively label these tellers by the amount of time they can finish tasks. Refer to the list.

- Teller A : Level 3 : Excellent : Can serve a person in 1 minute!
- Teller B : Level 2 : Average   : Can serve a person in 2 minutes.
- Teller C : Level 1 : Poor      : Can serve a person in 3 minutes...

Be mindful that these are only regular tasks each person will have for the tellers. There are also heavy tasks present. Heavy tasks take twice as long to finish, so that means Teller B can serve a heavy task in 4 minutes. It seems that heavy tasks are not that common, though. The tasks can be defined as follows.

- Normal Task : 1x multiplier to how long the teller can serve. : 75% chance a person has this task.
- Heavy Task  : 2x multiplier to how long the teller can serve! : 15% chance a person has this task.

With these entities in mind, the following scenarios must be made. Allow the simulation to be limited to 50 people coming in the system. The simulation can be written in a per-minute behavior (each loop in the simulation will simulate 1 minute). In each minute, **0 to 5 people may come in line**. The Tellers will process the task of a person when the Teller is available. Once the task is finished, persons with those tasks will leave the system.

The simulation must output the amount of time it took to process all tasks and people.

## Scenario A

The old system in simulation form. People will naturally have a task on hand, and they can either be a heavy task, or a normal task. A person will go to a free teller instead of an occupied one. If all tellers are occupied, then people will fall in line to the teller where there is the least number of people in line. If all tellers are free, or if people falling in line are all equal for all tellers, then people will choose a random teller.

## Scenario B

The newer system thought of. Introduce a new entity called the Dispatcher who directs people where to fall in line. The dispatcher knows what tasks the people have. The dispatcher also knows how much time each teller has on their line, so the dispatcher is able to deduce the optimized process. The optimized process should produce a less amount of time than Scenario A.

# Clarifications

If there are question, ask [Jenek](mailto:jenek@nueca.com.ph).
