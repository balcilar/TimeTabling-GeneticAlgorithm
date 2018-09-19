# A Genetic Algorithm Solution for Weekly Course Timetabling Problem

Genetic Algirthms are the method for finding enough good solutions of the problems which cannot be solved by standard method named NP-Hard problems. Although it does not guaranty the best solution, we can find relatively enough good solutions on most engineering problems within that method [1]. 

Educational instuties such as high schools universities use weekly course timetabling to use all sources in the optimum way. To make an optimum weekly timetable is such an example of HP-Hard problem which cannot be solved in any brutal force method which check every single probabilities. In this repository, we provided a solution of that problem using Genetic Algorithm which tries to minimize determined fitness function which that function is a sort of measurement of how the timetable is optimum.

## Inputs

Our method needs the inputs in 3 different excel sheet table. The first table shoudl include year, course code, course hour, lecturer name and number of student registered that course are mandatory fields. In addition to that fields, you can write any courses prefered day, classroom adn starting hour too. In following figure you can find one example of provided inputs for table1.

![Sample image](Output/courses.jpg?raw=true "Title")

According to that table, teh second row course and 11th row course have some selection. SEcond row course's prefered classroom id is 1, preferedn day is 0 which means there is no day selection, prefered session is zero means there is no session selection. That means we wanted to assign that course in classroom 1, but we have no any other selection. If algorithm assign that course on that classroom it gains 0.9 points per student who registered that course. For 11th row course,it prefered to be in clasroom4, it prefered to be in 3th day which means Wednesday, adn it preferend to be in session1. That the effect of this selection is 0.5. 

In following figure, you can find table2 and table3 simultaneously. Table2 is for sessions for each day adn their penalty values per student if we assign any course at certain session. In given table, we do not prefer to assign a course at the frist and last session. The first sessions peanly is 1 but last sessions penalty is 0.5 per student. Third table is for classrooms and their capacities. 

![Sample image](Output/classhours.jpg?raw=true "Title")

## Symbols and Meanings.

![Sample image](Output/variables.jpg?raw=true "Title")

## Constraints

![Sample image](Output/Constraints.jpg?raw=true "Title")

## Fitness Function

We should reach those 3 objections.
* All course must be on the prefered day,session and hours as highly as possible 
* We should avoid to assign a course on unwanted time 
* We shoudl assign course on a classroom as big as possible.

If we suppose our problem as minimization problem, the first objection should be negative, second objection should be positive and third one is again negative. Here is out fitness function.

![Sample image](Output/fitness.jpg?raw=true "Title")

## Heuristic

We need an heuristic assignment algorithm to assign every courses with meet all constraints. In that project we implemented an heuristic algorithm which calculate the possible assignment for each course with meeting all constraints. Genetic algorithm is for selecting in which possible assignment has to be selected. Our heristic steps are shown below steps.

* Take next course in course table.
* List all possible day, session classroom for that course which meets the constraints.
* If there is no possibility than make the fitness value as positive infinite value and break the loop.
* In that list, use the certain chromosene of genetic algorithm which is in range of [0 1]. If gene is 0 means select the first possibility, if gene is 1 means select the last possibility. the other selections are linearly distribute in range of [0 1].
* Assign that course in the selection possibility by Genetic algorithm.
* If tall course are assigned, than calculate the total fitness value and return , unless go to step1.

## Genetic Algorithm

Our genetic Algorithm consist of choromose which is equal to number of courses to be scheduled. For instance in our example case, there are 49 number of course, So our gene has 49 chromose too. Here is a sample of one chromosone.

![Sample image](Output/chromosome.jpg?raw=true "Title")

According to above chromosone, lets suppose for first course we have 400 different pssibilities to assign. Since the chromosone value is 0.452335503, we need to select 400x0.452335503=180,98≈181th possibility. We apply that rule for each chromosone step by step to the end. We used 500 for population size, uniform random initial population creation, %5 elitism rate, 200 maximum iteration. We used hybrid search by patternsearch.





