%% Function to initialize the Acrobot parameters

clear all
close all
clc

% Parameters of robot

m1 = 1;
m2 = 1;
l1 = 1;
l2 = 2;
lc1 = 0.5;
lc2 = 1;
I1 = 0.083;
I2 = 0.33;
g = 9.8;

par = [m1,m2,l1,l2,lc1,lc2,I1,I2,g];

% Initial Conditions: Down-Down Position

q1_0 = -pi/2;
q2_0 = 0;
qd1_0 = 0;
qd2_0 = 0;

q0 = [q1_0, q2_0, qd1_0, qd2_0];
