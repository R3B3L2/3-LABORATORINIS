clc
clear all 
close all 
format shortg
stud_nr = 20174372
DL  = [mod(stud_nr,2)+5    mod(stud_nr,3)+4   mod(stud_nr,4)+1    mod(stud_nr,5)+5  ];
K1  = [mod(stud_nr,7)+3    mod(stud_nr,5)+4   mod(stud_nr,9)+2    mod(stud_nr,3)+5  ];
K2  = [mod(stud_nr,13)+2   mod(stud_nr,4)+7   mod(stud_nr,9)+4    mod(stud_nr,3)+3  ];
K3  = [mod(stud_nr,6)+2    mod(stud_nr,7)+4   mod(stud_nr,6)+5    mod(stud_nr,3)+1  ];
PK  = [mod(stud_nr,11)+60  mod(stud_nr,6)+50  mod(stud_nr,21)+20  mod(stud_nr,36)+70];
DLmax=780;
K1max=mod(stud_nr,100)*2+400;
K2max=mod(stud_nr,300)+700;
P2=15
P3=50
GS = [1 1 1 1];
GMmin=mod(stud_nr,150)+250;
A=vertcat(DL, K1,K2,-GS)
b=[DLmax K1max K2max -GMmin]
f=PK
n=length(f); %kintamuju skaicius
m=length(b); %nelygybes tipo ribojimu skaicius
ind_n=1:n; ind_m=1:m;
ub=[]; %x virsutines ribos
lb = zeros(n,1); %x apatines ribos
options = optimset; options.Display='iter'; %options.LargeScale='off';
%options.Algorithm='active-set';
options.Algorithm='interior-point-legacy';
%options.Algorithm='dual-simplex';
%options.Algorithm='interior-point';
[x,fval,exitflag,output,lambda] = linprog(-f,A,b,[],[],lb,ub,[],options);
nelygybiu=lambda.ineqlin;
fprintf('=====================================================\n');
fprintf('\n P R A D I N I A I D U O M E N Y S\n\n Max Z=');
for i=1:n 
    fprintf('%4.0fx%1.0f %4.0f x%1.0f',f(i),ind_n(i)); 
end
fprintf('\n\n');
for j=1:m
    for i=1:n 
        fprintf('%4.0f x%1.0f %4.0f x%1.0f',A(j,i),i); 
    end
    fprintf(' <= %4.1f \n',b(j));
end
fprintf('\n======================================================\n');
fprintf('\n R E Z U L T A T A I \n');
fprintf('\n Tikslo funkcijos optimali reiksme = %8.4f\n',-fval);
fprintf('\n Optimalus sprendinys:');
for i=1:n 
    fprintf('\n x%1.0f = %8.4f',i,x(i));
end
fprintf('\n');
sum_x_DL=sum(x.*DL')
sum_x_K1=sum(x.*K1')
sum_x_K2=sum(x.*K2')
sum_x_GS=sum(x.*GS')

