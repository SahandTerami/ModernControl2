# 📘 Modern Control 2

This repository contains projects from the Modern Control 2 course.

## 📁 Directory Structure

- `Project 1/` – Codes and description for the project of 'Continuous and Discrete Kalman Filter Design '
- `Project 2/` – Codes and description for the project of 'Model and Control of a Vehicle's Active Suspension System'
- `README.md` – You’re here!

## 🎯 Purposes

- `Project 1:` – The purpose of the project is to deepen understanding of the operation and simulation of the optimal Kalman filter estimator in continuous-time and discrete-time linear dynamic systems

- `Project 2:` – The purpose is to design a control system for an active suspension system of a vehicle.

## 🧠 Technical Notes

- All code is written in **MATLAB/Simulink**.


## 🛠️ Project 1
**Description:**

The system dynamic equations are given as follows:

<img width="938" height="301" alt="image" src="https://github.com/user-attachments/assets/6518e716-1df2-46f9-aa26-9305d880d2d9" />

In these equations, 𝑤(𝑡) is the disturbance input vector, and 𝑣(𝑡) is the measurement noise. Assume that the initial conditions of this system are random variables with a Gaussian distribution such that:

<img width="658" height="403" alt="image" src="https://github.com/user-attachments/assets/e02bbdc4-21ba-4b2d-8baa-ebc436972e9b" />

The input 𝑢(𝑡) is a known deterministic input function. Assume that the disturbance input vector 𝑤(𝑡) and the output noise 𝑣(𝑡) are white Gaussian stochastic processes with the following characteristics:

<img width="238" height="154" alt="image" src="https://github.com/user-attachments/assets/9817b0f5-3b8d-4d93-ae6b-58e0035784e5" />

It is assumed that the initial condition vector, the disturbance input vector, and the output noise vector are all mutually uncorrelated.

**Continuous-time system:** 
- `a:` Write the complete Kalman filter equations (including the one-step ahead prediction equation, the estimation equation, the one-step ahead estimation error covariance matrix equation, the estimation covariance matrix, and the Kalman gain) for this continuous-time system.
- `b:` By simulating the results in MATLAB software, plot the time variation curves of the estimated state variables 𝑥hat_𝑖(𝑡∣𝑡) and the estimation error covariance matrix as functions of time.
- `c:` By varying the values of the initial condition covariance, output noise covariance, and input disturbance covariances, examine their effects on the system response.

**Discrete-time system:** 
- `a:` Using MATLAB simulation, plot the time response of the estimated state variables 𝑥hat_𝑖(𝑡∣𝑡) and the estimation error covariance matrix.
- `b:` By varying the values of the initial condition covariance, output noise covariance, and disturbance input covariances, examine their effects on the response of the discrete-time system.

## 🛠️ Project 2
**Description:**  

This system models the quarter-car vibration as shown in the figure. The input to the system is the force U(t), and the output is the displacement 𝑥1(𝑡).

<img width="479" height="355" alt="image" src="https://github.com/user-attachments/assets/37db7433-9b1a-463d-a746-a0442c0dafab" />

- `a:` Find the transfer function between the input u and the output y = x1
- `b:` To simulate the open-loop behavior of the system, obtain and plot the state variables’ responses considering non-zero initial conditions.
- `c:` Investigate which classical controllers (P-action, PI-action, or PID-action) can be applied to the system to satisfy the controller design requirements. Implement each controller that is feasible for the system.
- `d:` Investigate whether an advanced state vector feedback controller (SVFC) can be designed for the system. If yes, design and implement such a controller that meets the specified requirements.
- `e:` Design a continuous-time full-state observer to estimate the system’s state variables and demonstrate that the estimation performs correctly.
