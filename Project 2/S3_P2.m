%%% Sahand tang erami%%%
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
%State_variable_matrixes
A=[0 1 0 -1;-(ks/ms) -(cs/ms) 0 cs/ms; 0 0 0 1;ks/mu cs/mu -kt/mu -(cs+ct)/mu];
B=[0 0;0 1/ms;-1 0;ct/mu -1/mu];
C=[1 0 0 0;-(ks/ms) -(cs/ms) 0 cs/ms];
D=[0 0;1 1/ms];
Q=[10e5 0 0 0;0 0 0 0;0 0 0 0;0 0 0 0];
%LQR_Gain and A_close_loop
[K,P,e]=lqr(A,B(:,2),Q,0.01);
A_closeloop=A-B(:,2)*K;
%input
Unitestep=@(t) double(t>=0);
tf=20;
dt=0.01;
t=(0:dt:tf)';
N=length(t);
U1(1)=0.1;
U1(2:N)=0;
U2=Unitestep(t);
x(:,1)=0;
sys=ss(A_closeloop,B,C,D);
[y,~,x]=lsim(sys,[U1' U2],t);
%finding_max_values
max_x1=max(x(:,1));
min_x1=min(x(:,1));
if max_x1>abs(min_x1)
   fprintf('Maximum value of x1 is :%d',max_x1);
   disp(' ')
else
   fprintf('Maximum value of x1 is :%d',abs(min_x1));
   disp(' ')
end
max_x2=max(x(:,2));
min_x2=min(x(:,2));
if max_x2>abs(min_x2)
   fprintf('Maximum value of x2 is :%d',max_x2);
   disp(' ')
else
   fprintf('Maximum value of x2 is :%d',abs(min_x2));
   disp(' ')
end  
max_x3=max(x(:,3));
min_x3=min(x(:,3));
if max_x3>abs(min_x3)
   fprintf('Maximum value of x3 is :%d',max_x3);
   disp('         ')
else
   fprintf('Maximum value of x3 is :%d',abs(min_x3));
   disp('         ')
end 
max_x4=max(x(:,4));
min_x4=min(x(:,4));
if max_x4>abs(min_x4)
   fprintf('Maximum value of x4 is :%d',max_x4);
   disp('         ')
else
   fprintf('Maximum value of x4 is :%d',abs(min_x4));
   disp('         ')
end
%Plot
figure (1)
plot(t,x(:,1))
axis([0,9,0,1.4e-4])
grid on
legend('X_{1}')
xlabel('time(sec)')
ylabel('Amplitude')

figure (2)
plot(t,x(:,2))
axis([0,9,-0.02,0.02])
grid on
legend('X_{2}')
xlabel('time(sec)')
ylabel('Amplitude')

figure (3)
plot(t,x(:,3))
axis([0,9,-1e-3,1e-3])
grid on
legend('X_{3}')
xlabel('time(sec)')
ylabel('Amplitude')

figure (4)
plot(t,x(:,4))
axis([0,8,-0.02,0.02])
grid on
legend('X_{4}')
xlabel('time(sec)')
ylabel('Amplitude')