```
# 3-LABORATORINIS/GAMYBOS PLANAVIMO UŽDAVINYS
### (FAILAS UŽDUOTIES IŠ MATLAB ĮKELTAS. PRIEDAS NR.1).
## 1. SĄLYGA.
![Salyga](https://user-images.githubusercontent.com/47916355/58371063-b093e000-7f16-11e9-928f-5afb55f25875.png)
## 2. UŽDUOTIES REALIZACIJA MATLAB.
```
```
clc
clear all 
close all 
format shortg
stud_nr = 20174372
DL  = [mod(stud_nr,2)+5    mod(stud_nr,3)+4   mod(stud_nr,4)+1    mod(stud_nr,5)+5  ];
%DL - vieno darbininko darbo laikas vienos rusies gaminio gamybai (val.)=
%A,B,C,D;
K1  = [mod(stud_nr,7)+3    mod(stud_nr,5)+4   mod(stud_nr,9)+2    mod(stud_nr,3)+5  ];
%K1 - 1 klases sanaudos vienam gaminiui = A,B,C,D;
K2  = [mod(stud_nr,13)+2   mod(stud_nr,4)+7   mod(stud_nr,9)+4    mod(stud_nr,3)+3  ];
%K2 - 2 klases sanaudos vienam gaminiui = A,B,C,D;
K3  = [mod(stud_nr,6)+2    mod(stud_nr,7)+4   mod(stud_nr,6)+5    mod(stud_nr,3)+1  ];
%K3 - 3 klases sanaudos vienam gaminiui = A,B,C,D;
PK  = [mod(stud_nr,11)+60  mod(stud_nr,6)+50  mod(stud_nr,21)+20  mod(stud_nr,36)+70];
% PK - pardavimo kaina (vnt.) = A,B,C,D;
DLmax=780;%Darbininku darbo laiko istekliai per 10 d.d.;
K1max=mod(stud_nr,100)*2+400;% analogiska nelygybe 1 klases sanaudoms;
K2max=mod(stud_nr,300)+700;% tokia pati nelygybe 2 klases sanaudoms;
P2=15% 2 klases sanaudoms kai vnt. kaina 15EUR;
P3=50% 3 klases = 50 EUR/vnt.;
GS = [1 1 1 1];
GMmin=mod(stud_nr,150)+250;
A=vertcat(DL, K1,K2,-GS)
b=[DLmax K1max K2max -GMmin]
f=PK
n=length(f); %kintamųjų skaičius
m=length(b); %nelygybės tipo ribojimų skaičius
ind_n=1:n; ind_m=1:m;
ub=[]; %x viršutinės ribos
lb = zeros(n,1); %x apatinės ribos
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
```
## 3. 1-2 UŽDUOČIŲ REZULTATAI.
```js
stud_nr = 20174372
P2 = 15
P3 = 50
A =
     5     6     1     7
     4     6    10     7
    12     7    12     5
    -1    -1    -1    -1

b = 780   544   972  -372
f = 69    52    28    78

  ---------------------------------------------------
  Iter    0:  1.14e+04 2.66e+02 1.14e+05 5.71e+04
  Iter    1:  5.95e+03 4.26e-14 4.43e+04 4.22e+00
  Iter    2:  5.56e+03 1.07e-12 6.51e+04 3.94e+00
  Iter    3:  5.40e+03 2.00e-11 6.03e+05 3.83e+00
  Iter    4:  5.15e+03 5.23e-09 8.63e+06 3.65e+00
  Iter    5:  5.15e+03 7.96e-04 7.44e+10 3.65e+00
  Iter    6:  5.15e+03 2.54e+01 7.94e+15 3.65e+00
  Iter    7:  5.15e+03 5.63e+03 1.47e+15 4.71e+01

=====================================================

 PRADINIAI  DUOMENYS:

 Max Z=  69x1   52x2   28x3   78x4 

   5 x1    6 x2    1 x3    7 x4  <= 780.0 
   4 x1    6 x2   10 x3    7 x4  <= 544.0 
  12 x1    7 x2   12 x3    5 x4  <= 972.0 
  -1 x1   -1 x2   -1 x3   -1 x4  <= -372.0 

======================================================

 REZULTATAI:

 Tikslo funkcijos optimali reikšmė = 27518.1595

 Optimalus sprendinys:
 x1 =  87.9818
 x2 = 360.5720
 x3 =  96.3454
 x4 =   0.0000

sum_x_DL = 2699.7
sum_x_K1 = 3478.8
sum_x_K2 = 4735.9
sum_x_GS = 544.9
```
>> 

## 4. 3 UŽDUOTIES REALIZACIJA MATLAB.(Kai pridedama prekė "E").
```
DL  = [mod(stud_nr,2)+5    mod(stud_nr,3)+4   mod(stud_nr,4)+1    mod(stud_nr,5)+5 mod(stud_nr,6)+5 ];
% prideta E mod(stud_nr,6)+5 
%DL - vieno darbininko darbo laikas vienos rusies gaminio gamybai (val.)=
%A,B,C,D;
K1  = [mod(stud_nr,7)+3    mod(stud_nr,5)+4   mod(stud_nr,9)+2    mod(stud_nr,3)+5  mod(stud_nr,6)+5];
% prideta E mod(stud_nr,6)+5
%K1 - 1 klases sanaudos vienam gaminiui = A,B,C,D;
K2  = [mod(stud_nr,13)+2   mod(stud_nr,4)+7   mod(stud_nr,9)+4    mod(stud_nr,3)+3  mod(stud_nr,6)+5];
% prideta E mod(stud_nr,6)+5
%K2 - 2 klases sanaudos vienam gaminiui = A,B,C,D;
K3  = [mod(stud_nr,6)+2    mod(stud_nr,7)+4   mod(stud_nr,6)+5    mod(stud_nr,3)+1  mod(stud_nr,6)+5];
% prideta E mod(stud_nr,6)+5
%K3 - 3 klases sanaudos vienam gaminiui = A,B,C,D;
PK  = [mod(stud_nr,11)+60  mod(stud_nr,6)+50  mod(stud_nr,21)+20  mod(stud_nr,36)+70 mod(stud_nr,40)+30];
% prideta E mod(stud_nr,40)+30
% PK - pardavimo kaina (vnt.) = A,B,C,D;
```
## 5. 3 UŽDUOTIES REZULTATAI.(Kai pridedama prekė "E").
```js
A =
     5     6     1     7     7
     4     6    10     7     7
    12     7    12     5     7
    -1    -1    -1    -1    -1

b =780   544   972  -372
f =69    52    28    78    42

  Residuals:   Primal     Dual     Duality    Total
               Infeas    Infeas      Gap       Rel
               A*x-b    A'*y+z-f    x'*z      Error
  ---------------------------------------------------
  Iter    0:  1.45e+04 2.87e+02 1.33e+05 6.80e+04
  Iter    1:  7.56e+03 1.01e-13 5.51e+04 5.36e+00
  Iter    2:  6.99e+03 3.20e-13 6.80e+04 4.96e+00
  Iter    3:  6.63e+03 1.35e-11 8.04e+05 4.70e+00
  Iter    4:  6.19e+03 1.55e-09 1.51e+07 4.39e+00
  Iter    5:  6.17e+03 9.58e-05 1.59e+11 4.38e+00
  Iter    6:  6.16e+03 3.87e+01 1.28e+15 4.37e+00
  Iter    7:  6.16e+03 3.72e+01 1.28e+15 4.37e+00

=====================================================

 P R A D I N I A I  D U O M E N Y S

 Max Z=  69x1   52x2   28x3   78x4   42x5 

   5 x1    6 x2    1 x3    7 x4    7 x5  <= 780.0 
   4 x1    6 x2   10 x3    7 x4    7 x5  <= 544.0 
  12 x1    7 x2   12 x3    5 x4    7 x5  <= 972.0 
  -1 x1   -1 x2   -1 x3   -1 x4   -1 x5  <= -372.0 

======================================================

 R E Z U L T A T A I 

 Tikslo funkcijos optimali reiksme = 32559.3694

 Optimalus sprendinys:
 x1 =  68.9129
 x2 = 487.1001
 x3 =  88.3426
 x4 =   0.0196
 x5 =   0.0013

sum_x_DL =3355.7
sum_x_K1 =4081.8
sum_x_K2 =5296.9
sum_x_GS =644.38
```
>> 
