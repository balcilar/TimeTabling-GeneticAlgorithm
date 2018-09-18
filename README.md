# A genetic Algorithm Solution for Weekly Course Timetabling Problem

Genetic Algirthms are the method for finding enough good solutions of the problems which cannot be solved by standard method named NP-Hard problems. Although it does not guaranty the best solution, we can find relatively enough good solutions on most engineering problems within that method [1]. 

Educational instuties such as high schools universities use weekly course timetabling to use all sources in the optimum way. To make an optimum weekly timetable is such an example of HP-Hard problem which cannot be solved in any brutal force method which check every single probabilities. In this repository, we provided a solution of that problem using Genetic Algorithm which tries to minimize determined fitness function which that function is a sort of measurement of how the timetable is optimum.

## Inputs

Our method needs the inputs in 3 different excel sheet table. The first table shoudl include year, course code, course hour, lecturer name and number of student registered that course are mandatory fields. In addition to that fields, you can write any courses prefered day, classroom adn starting hour too. In following figure you can find one example of provided inputs for table1.

![Sample image](Output/courses.jpg?raw=true "Title")


Ders programı oluşturulacak okul, bölüm yada fakültenin verileri excel dosyasından okunmaktadır. Bu bilgiler 3 tablo halinde excel dosyasından okunmuştur. 1.tabloda Sınıf, Derskodu, ders saati, dersi veren öğretim üyesi, dersi alan öğrenci sayısı zorunlu alanlardır. Buna ek olarak eğer bu ders için bir tercih varsa, atanması istenilen derslik, gün, saat ve bu atamanın ağırlığını bildiren [0-1] aralığındaki ağırlık belirtilmelidir. Aşağıda örnek okunan tablo1 den bir kaç satır örnek görünmektedir.
