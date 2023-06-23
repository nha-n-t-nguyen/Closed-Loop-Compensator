clear
% This is the plot for the uncompensated G(s) of G(s)=10/(s(s+2)(S+5))
k=linspace(0,50);z=[];p=[0 -2 -5];K=10;H=1;
G1=zpk(z,p,K)
rlocus(G1)
title('Root Locus of Uncompensated G(s)')
figure
t= 0:0.01:10; H = 1;
Gf1= feedback(G1,H)
step(Gf1,t)
title('Step Response of the Uncompensated G(s) in Closed Loop')

% This is the plot for the compensated G(s) with lead lag compensator
% L(s)=9.6(s+5)(s+4.5454)/{(s+8)(s+0.545454))
figure
Z =[-5 -4.5454];
P=[-8 -.54545 0 -2 -5];
Kc = 9.6*10;
G2=zpk(Z,P,Kc)
rlocus(G2)
title('Root Locus of Compensated G(s)')
hold on;
plot(-2,2*3^.5,'mo',-2,-2*3^.5,'mo')
figure
Gf2= feedback(G2,H)
step(Gf2,t)
title('Step Response of the Compensated G(s) in Closed Loop')