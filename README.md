# A genetic Algorithm Solution for Weekly Course Timetabling Problem

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
