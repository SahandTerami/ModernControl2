%%% Sahand Tang Erami%%%
%%% Advanced Control II Project%%%
clc
clear
close all
%Parameter
ms=2.45;
mu=1;
ks=900;
kt=1250;
cs=7.5;
ct=5;
%State_variable_matrixes
A=[0 1 0 -1;-(ks/ms) -(cs/ms) 0 cs/ms; 0 0 0 1;ks/mu cs/mu -kt/mu -(cs+ct)/mu];
B=[0;0;-1;ct/mu];
C=[1 0 0 0;-(ks/ms) -(cs/ms) 0 cs/ms];
D=[0;1];
G=[0;0;0;0];
H=[0;0];
Q=0;
R=[0.01*(10^(-6)) 0;0 0.01*(10^(-6))];
%Kalman_filter
sys=ss(A,[B G],C,[D H]);
[KF L P]=kalman(sys,Q,R);
%input
tf=10;
dt=0.01;
t=(0:dt:tf)';
N=length(t);
u(1)=0.1;
u(2:N)=0;
%Noise
w=mvnrnd(0,Q,numel(t));
v=mvnrnd([0;0],R,numel(t));
x0=[-0.001 -0.001 -0.001 -0.001];
[y,~,x]=lsim(sys,[u' w],t,x0);
z=y+v;
%Observed
yxhat=lsim(KF,[u' z],t);
yhat=yxhat(:,1:size(C,1));
xhat=yxhat(:,size(C,1)+1:end);
%Plot
figure
plot(t,xhat(:,1))
hold on
plot(t,x(:,1))
legend('Xhat_1','X_1')
xlabel('Time(sec)')
ylabel('Amplitude')
title('First State')
grid on

figure
plot(t,xhat(:,2))
hold on
plot(t,x(:,2))
legend('Xhat_2','X_2')
xlabel('Time(sec)')
ylabel('Amplitude')
title('2nd State')
grid on
 
figure
plot(t,xhat(:,3))
hold on
plot(t,x(:,3))
legend('Xhat_3','X_3')
xlabel('Time(sec))')
ylabel('Amplitude')
title('3rd State')
grid on

figure
plot(t,xhat(:,4))
hold on
plot(t,x(:,4))
legend('Xhat_4','X_4')
xlabel('Time(sec)')
ylabel('Amplitude')
title('4th State')
grid on
