function scores = ders_programi_fitness(x,Cakisma,Derslik,Gunsaat,DersSaat,DersMevcut,Ceza,tercih)
%% written by Muhammet Balcilar, France
% All rights reserved

scores = zeros(size(x,1),1);
for j = 1:size(x,1)     
    %[f Atama]=myfitness(x{j},Cakisma,Derslik,Gunsaat,DersSaat,DersMevcut,Ceza,tercih);
    [f Atama]=myfitness(x(j,:),Cakisma,Derslik,Gunsaat,DersSaat,DersMevcut,Ceza,tercih);
    scores(j) = f;
end
