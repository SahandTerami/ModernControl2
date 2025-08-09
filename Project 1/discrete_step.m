%%%Sahand_tang_erami%%%
%%%Advanced_Control_II_project%%%
clear all
close all
clc
%state_variable_matrixes
A=[-3 0 -1;0 -2 1;0 1 -9];
B=[1;0;5];
C=[1 2 0];
D=0;
%initial_value_and_noise_parameter
G=[1 0;0 1;1 0];
Q=[4 0;0 0.3];
x0=[0 0.5 -1];
R=10;
Ts=0.1;
M{1}=[1 0 0;0 0.02 0;0 0 0.5];
n(:,1)=x0;
O1(1)=1;
O2(1)=0;
O3(1)=0;
O4(1)=0.02;
O5(1)=0;
O6(1)=0.5;
%time_difference
tf=5;
dt=0.1;
t=(0:dt:tf)';
N=length(t);
%discrete_State_space_matrix
[Ad,Bd]=c2d(A,B,Ts)
[Ad,Gd]=c2d(A,G,Ts)
Cd=C;
Dd=D;
H=ss(Ad,[Bd Gd],Cd,Dd,0.1);
%input
Unitestep=@(t) double(t>=0);
tf=5;
dt=0.1;
t=(0:dt:tf)';
u=Unitestep(t);
%noise
w=mvnrnd([0;0],Q,numel(t));
v=mvnrnd(0,R,numel(t));
[y,~,x]=lsim(H,[u w],t,x0);
z=y+v;
%Calculating_Gain_and_error_covariance 
for i=1:N-1
  M{i+1}=Ad*M{i}*Ad'+Gd*Q*Gd'-Ad*M{i}*Cd'*inv(Cd*M{i}*Cd'+R)*C*M{i}*Ad';
  L{i+1}=M{i+1}*C'*inv(C*M{i+1}*C'+R);
  n(:,i+1)=Ad*n(:,i)+Bd*u(i);
  xhat(:,i+1)=n(:,i+1)+L{i+1}*(z(i+1)-C*n(:,i+1));
  O1(i+1)=M{i+1}(1,1);
  O2(i+1)=M{i+1}(1,2);
  O3(i+1)=M{i+1}(1,3);
  O4(i+1)=M{i+1}(2,2);
  O5(i+1)=M{i+1}(2,3);
  O6(i+1)=M{i+1}(3,3);
end
%plot
figure
plot(t,xhat(1,:),'b')
hold on
plot(t,x(:,1),'r')
grid on
xlabel('Time(sec)');
ylabel('Amplitude');
legend('Xhat_{1}','x_1')
title('First State')

figure
plot(t,xhat(2,:),'b')
hold on
plot(t,x(:,2),'r')
grid on
xlabel('Time(sec)');
ylabel('Amplitude');
legend('Xhat_{2}','x_2')
title('2nd State')

figure
plot(t,xhat(3,:),'b')
hold on
plot(t,x(:,3),'r')
grid on
xlabel('Time(sec)');
ylabel('Amplitude');
legend('Xhat_{3}','x_3')
title('3rd State')

figure
plot(t,O1)
hold on
plot(t,O2)
hold on
plot(t,O3)
hold on
plot(t,O4)
hold on
plot(t,O5)
hold on
plot(t,O6)
grid on
legend('M_1(t)','M_2(t)','M_3(t)','M_4(t)','M_5(t)','M_6(t)')
xlabel('Time(sec)');
ylabel('Amplitude');