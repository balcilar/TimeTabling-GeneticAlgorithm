function [f Atama]=myfitness(x,Cakisma,Derslik,Gunsaat,DersSaat,DersMevcut,Ceza,tercih)
f=0;
% nders=length(x)/2;
% p=x(1:nders);
% r=x(nders+1:end);

nders=length(x);
p=1:nders;
r=x(1:nders);

Atama=zeros(Gunsaat * 5 , length(Derslik));
DersAtanabilir=zeros(Gunsaat * 5,nders);

for i=1:length(DersSaat)    
    [Atama DersAtanabilir sonuc]=dersAta(p(i),DersSaat(p(i)),DersMevcut(p(i)),r(i),Atama,DersAtanabilir,Cakisma,Derslik);
    if (sonuc==0)
        f=inf;
        break;
    end
end
A=Atama;
I=find(A>0);
A(I)=DersMevcut(A(I));


% erken yada gec dersler icin ogrenci basina ceza hesaplaniyor
f1=sum(sum(A.*repmat(Ceza,[1 size(A,2)])));


% buyuk siniflari secmek adina bos kalan yerler kadar mukafat veriliyor
derslik=repmat(Derslik',[size(A,1) 1]);
bosyer=derslik-A;
f2=sum(sum(bosyer(I)));

% tercih uyuyorsa dersi alan ogrenci sayisinca tercih etkisi kadar mukafat
% verilir.
J=find(~isnan(tercih(:,1)));

f3=0;
for i=1:length(J)
    
    mask_sinif=zeros(1,size(Atama,2));
    if tercih(J(i),1)==0
        mask_sinif=ones(1,size(Atama,2));
    else
        mask_sinif(tercih(J(i),1))=1;
    end
    mask_gun=zeros(1,5);
    if tercih(J(i),2)==0
        mask_gun=ones(1,5);
    else
        mask_gun(tercih(J(i),2))=1;
    end
    mask_saat=zeros(Gunsaat,1);
    if tercih(J(i),3)==0
        mask_saat=ones(Gunsaat,1);
    else
        mask_saat(tercih(J(i),3):min(Gunsaat,tercih(J(i),3)-1+DersSaat(J(i))))=1;
    end
    mask_ts=[];
    for j=1:length(mask_gun)
        if mask_gun(j)==1
            mask_ts=[mask_ts;mask_saat];
        else
            mask_ts=[mask_ts;zeros(length(mask_saat),1)];
        end
    end
    mask=[];
    for j=1:length(mask_sinif)
        if mask_sinif(j)==1
            mask=[mask mask_ts];
        else
            mask=[mask zeros(length(mask_ts),1)];
        end
    end
    f3=f3+sum(sum((Atama==J(i)).*A.*mask*tercih(J(i),4)));
end

f=f1-f2-f3;
    
    




