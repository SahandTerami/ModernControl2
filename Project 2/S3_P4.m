%%% Sahand Tang Erami%%%
%%% Advanced Control II Project%%%
clear all
close all
clc
%Parameter
ms=2.45;
mu=1;
ks=900;
kt=1250;
cs=7.5;
ct=5;
%State Space Matrixes
A=[0 1 0 -1;-(ks/ms) -(cs/ms) 0 cs/ms; 0 0 0 1;ks/mu cs/mu -kt/mu -(cs+ct)/mu];
B=[0 0;0 1/ms;-1 0;ct/mu -1/mu];
C=[1 0 0 0;-(ks/ms) -(cs/ms) 0 cs/ms];
D=[0 0;1 1/ms];
Q=[10e5 0 0 0;0 0 0 0;0 0 0 0;0 0 0 0];
%LQR Gain
[K,P,e]=lqr(A,B(:,2),Q,0.01);