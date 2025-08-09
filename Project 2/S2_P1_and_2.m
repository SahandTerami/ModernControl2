%%% Sahand_Tang_Erami %%%
%%% Advanced_Control_II %%%
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
%State_Space_Matrixes
A=[0 1 0 -1;-(ks/ms) -(cs/ms) 0 cs/ms; 0 0 0 1;ks/mu cs/mu -kt/mu -(cs+ct)/mu];
B=[0;1/ms;0;-1/mu];
C=[1 0 0 0;-(ks/ms) -(cs/ms) 0 cs/ms];
D=[0;1/ms];
Q=diag([10e5,0,0,0]);
R=0.01;
%LQR_Gain_and_Closeloop_System_Simulation
 [K,~,~]=lqr(A,B,Q,R);
 Ac=A-B*K;
 %input
 sys_closeloop=ss(Ac,B,C,D);
 Unitestep=@(t) double(t>=0);
 tf=5;
 dt=0.01;
 t=(0:dt:tf)';
 N=length(t);
 u=Unitestep(t);
  [y,~,x]=lsim(sys_closeloop,u,t);
  for i=1:N
  Fc(i)=-K*(x(i,:)');
  end
 %Plot
 figure
 plot(t,x(:,1))
 xlabel('time(sec)')
 ylabel('Amplitude')
 legend('X_1')
 title('optimal X_1(t)')
 grid on
 figure
 plot(t,x(:,2))
 xlabel('time(sec)')
 ylabel('Amplitude')
 legend('X_2')
 title('optimal X_2(t)')
 grid on
 figure
 plot(t,x(:,3))
 xlabel('time(sec)')
 ylabel('Amplitude')
 legend('X_3')
 title('optimal X_3(t)')
 grid on
 figure
 plot(t,x(:,4))
 xlabel('time(sec)')
 ylabel('Amplitude')
 legend('X_4')
 title('optimal X_4(t)')
 grid on
 figure
 plot(t,Fc(:))
 xlabel('time(sec)')
 ylabel('Amplitude')
 legend('F_c')
 title('optimal Control Input')
 grid on
 
 figure
 plot(t,y(:,1))
 xlabel('time(sec)')
 ylabel('Amplitude')
 title('First output')
 legend('y_1')
 grid on
 
  figure
 plot(t,y(:,2))
 xlabel('time(sec)')
 ylabel('Amplitude')
 title('Second output')
 legend('y_2')
 grid on
