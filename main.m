clear all
clc

dosya='Input/coursedefinitions.xlsx';


[A B]=xlsread(dosya,1);
nders=size(A,1);
Cakisma=zeros(nders,nders);
for i=1:nders
    for j=1:nders
        if i~=j && ((~isequal(B{i+1,5},B{j+1,5}) && A(i,1)==A(j,1)) || isequal(B{i+1,12},B{j+1,12}))
            Cakisma(i,j)=1;
        end
    end
end
DersSaat=A(:,6);
DersMevcut=A(:,11);
if (size(A,2)>11)
    tercih=A(:,12:15);    
else
    tercih=nan(size(A,1),4);
end

[C D]=xlsread(dosya,2);
Gunsaat=size(C,1);
Ceza=C(:,3:7);
Ceza=Ceza(:);

[E F]=xlsread(dosya,3);
Derslik=E;





FitnessFcn = @(x) ders_programi_fitness(x,Cakisma,Derslik,Gunsaat,DersSaat,DersMevcut,Ceza,tercih);
options = optimoptions(@ga,'MaxGenerations',200,'PopulationSize',500, ...
                            'PlotFcn', @gaplotbestf, ... 
                            'HybridFcn',@patternsearch, ...
                            'MutationFcn', {@mutationuniform, 0.1}, ...
                        'MaxStallGenerations',50,'UseVectorized',true);
[x,fval,reason,output] = ga(FitnessFcn,nders,[],[],[],[],zeros(nders,1),ones(nders,1),[],options);







[f Atama]=myfitness(x,Cakisma,Derslik,Gunsaat,DersSaat,DersMevcut,Ceza,tercih);

for i=1:size(Atama,1)
    q=[];qs=1;
    for j=1:size(Atama,2) 
        d=Atama(i,j);
        if (d>0)
            q=[q B{d+1,5} '-' B{d+1,4} '-'  B{d+1,11} ' ' B{d+1,12} '-' F{j+1,1} char(10)];
            qs=qs+1;
        end
    end
    q=q(1:end-1);
    
    gun=ceil(i/Gunsaat);
    saat=i- (gun-1)*Gunsaat;
    D{saat+1,gun+1}=q;
end


xlswrite('Output/result.xlsx',D);

hExcel = actxserver('Excel.Application');
hWorkbook = hExcel.Workbooks.Open([cd '\Output/result.xlsx']);
hWorksheet = hWorkbook.Sheets.Item(1);
hWorksheet.Columns.Item(1).columnWidth = 15; 
hWorksheet.Columns.Item(2).columnWidth = 40; 
hWorksheet.Columns.Item(3).columnWidth = 40; 
hWorksheet.Columns.Item(4).columnWidth = 40; 
hWorksheet.Columns.Item(5).columnWidth = 40; 
hWorksheet.Columns.Item(6).columnWidth = 40; 
hWorkbook.Save;
hWorkbook.Close;
hExcel.Quit;