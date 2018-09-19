# A Genetic Algorithm Solution for Weekly Course Timetabling Problem

Genetic Algorithms are the method for finding enough good solutions for the problems which cannot be solved by a standard method named NP-Hard problems. Although it does not guaranty the best solution, we can find relatively enough good solutions for most engineering problems within that method [1].

Educational institutes such as high schools universities use weekly course timetabling to use all sources in an optimum way. To make an optimum weekly timetable is such an example of NP-Hard problem which cannot be solved in any brutal force method which checks every single probability. In this repository, we provided a solution to that problem using Genetic Algorithm which tries to minimize determined fitness function which that function is a sort of measurement of how the timetable is optimum [2].

## Inputs

Our method needs the inputs in 3 different excel sheet table. The first table should include the year, course code, course hour, lecturer name and number of student registered that course are mandatory fields. In addition to that fields, you can write any courses preferred day, classroom and starting hour too. In the following figure, you can find one example of provided inputs for table1.

![Sample image](Output/courses.jpg?raw=true "Title")

According to that table, the second-row course and 11th-row course have some selection. Second-row course's preferred classroom id is 1, the preferred day is 0 which means there is no day selection, the preferred session is zero means there is no session selection. That means we wanted to assign that course in classroom 1, but we have no any other selection. If the algorithm assigns that course on that classroom it gains 0.9 points per student who registered that course. For 11th row course, it preferred to be in clasroom4, it preferred to be in 3th day which means Wednesday, and it preferred to be in session1. That the effect of this selection is 0.5. 

In the following figure, you can find table2 and table3 simultaneously. Table2 is for sessions for each day and their penalty values per student if we assign any course at the certain session. In the given table, we do not prefer to assign a course to the first and last session. The first sessions penalty is 1 but the last sessions penalty is 0.5 per student. The third table is for classrooms and their capacities. 

![Sample image](Output/classhours.jpg?raw=true "Title")

## Symbols and Meanings.

![Sample image](Output/variables.jpg?raw=true "Title")

## Constraints

![Sample image](Output/Constraints.jpg?raw=true "Title")

## Fitness Function

We should reach those 3 objections.
* All course must be on the preferred day, session and hours as high as possible 
* We should avoid assigning a course on unwanted time 
* We should assign course on a classroom as big as possible.

If we suppose our problem as the minimization problem, the first objective should be negative, the second objection should be positive and the third one is again negative. Here is our fitness function.

![Sample image](Output/fitness.jpg?raw=true "Title")

## Heuristic

We need a heuristic assignment algorithm to assign every course with meet all constraints. In that project, we implemented a heuristic algorithm which calculates the possible assignment for each course with meeting all constraints. The genetic algorithm is for selecting in which possible assignment has to be selected. Our heuristic steps are shown below steps.

* Take next course in course table.
* List all possible day, session classroom for that course which meets the constraints.
* If there is no possibility than make the fitness value as positive infinite value and break the loop.
* In that list, use the certain chromosome of the genetic algorithm which is in range of [0 1]. If the gene is 0 means select the first possibility if the gene is 1 means select the last possibility. the other selections are linearly distributed in the range of [0 1].
* Assign that course in the selection possibility by the Genetic algorithm.
* If all course is assigned than calculate the total fitness value and return unless go to step1.

## Genetic Algorithm

Our genetic Algorithm consists of the chromosome which is equal to the number of courses to be scheduled. For instance, in our example case, there is 49 number of course, So our gene has 49 chromosomes too. Here is a sample of one chromosome.

![Sample image](Output/chromosome.jpg?raw=true "Title")

According to the above chromosome, let's suppose for the first course we have 400 different possibilities to assign. Since the chromosome value is 0.452335503, we need to select 400x0.452335503=180,98≈181th possibility. We apply that rule for each chromosome step by step to the end. We used 500 for population size, uniform random initial population creation, %5 elitism rate, 200 maximum iteration. We used a hybrid search by pattern search.

## Result

In our test on the provided problem case, we reach -9899.2 fitness value. According to that fitness value, you can find the result of the final timetable on the following figure.

![Sample image](Output/result.jpg?raw=true "Title")

## References
[1] Reeves, Colin. "Genetic algorithms." Handbook of metaheuristics. Springer US, 2003. 55-82.

[2] Erben, R.W. & Kepler, J., 1995. A genetic Algorithm Solving a Weekly Course Timetabling Problem, Proc. Of the First Int. Conf. on the Practice and Theory of Automated Timetabling (ICPTAT), pp. 21-32, Napier University, Edinburgh.

