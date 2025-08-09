%%% Sahand_Tang_Erami%%%
%%% Advanced_Control_II_Project %%%
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
B=[0;0;-1;ct/mu];
C=[1 0 0 0;-(ks/ms) -(cs/ms) 0 cs/ms];
D=[0;1];
%simulation
tf=20;
dt=0.01;
t=(0:dt:tf)';
N=length(t);
U(1)=0.1;
U(2:N)=0;
x(:,1)=0;
sys=ss(A,B,C,D);
[y,~,x]=lsim(sys,U,t);
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
%Plots & Figures

figure
plot(t,x(:,1))
xlabel('time(sec)')
ylabel('Amplitude')
legend('X_{1}')
grid on

figure
plot(t,x(:,2))
xlabel('time(sec)')
ylabel('Amplitude')
legend('X_{2}')
grid on

figure
plot(t,x(:,3))
xlabel('time(sec)')
ylabel('Amplitude')
legend('X_{3}')
grid on

figure
plot(t,x(:,4))
xlabel('time(sec)')
ylabel('Amplitude')
legend('X_{4}')
grid on
