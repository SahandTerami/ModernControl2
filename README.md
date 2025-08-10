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

The Figure shows a two-degree-of-freedom model of a quarter-car active suspension system.

<img width="557" height="387" alt="image" src="https://github.com/user-attachments/assets/3900c776-0612-4bd2-83fb-fb11829b9d02" />


- `a:` Design a linear quadratic optimal controller for this system that minimizes the following cost function.
- `b:` Simulate the behavior of the optimal control system in MATLAB and plot all state variables, inputs, and outputs as functions of time.
- `c:` Simulate the passive suspension system and plot the system’s state variables over time. Determine the peak response values and the settling time.
- `d:` Simulate the active suspension system and plot the system’s state variables over time. Determine the peak response values and settling time. 
- `e:` Design a Kalman filter estimator for the passive suspension system, then simulate the system and plot the state variables over time.
