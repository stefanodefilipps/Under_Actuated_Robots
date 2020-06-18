clear all;
close all;

theta1 = 0.0799;
theta2 = 0.0244;
theta3 = 0.0205;
theta4 = 0.42126;
theta5 = 0.10630;
g = 9.8;

param = [theta1;theta2;theta3;theta4;theta5;g];

q10 = 0;
q20 = 0;
qd1_0 = 0;
qd2_0 = 0;

initialCondition = [q10;q20;qd1_0;qd2_0];

syms q1 q2 q1d q2d;

d11 = theta1 + theta2 + 2*theta3*cos(q2);
d12 = theta2 + theta3*cos(q2);
d21 = d12;
d22 = theta2;
h1 = theta3*sin(q2)*(-q1d*q2d -(q1d+q2d)*q2d);
h2 = theta3*sin(q2)*q1d^2;
phi1 = theta4*g*cos(q1) + theta5*g*cos(q1+q2);
phi2 = theta5*g*cos(q1+q2);

M = [d11 d12; d21 d22];
C = [h1;h2];
e = [phi1;phi2];
M_inv = inv(M);

j = jacobian(e,[q1;q2]);

% q1 = pi/2;
% q2 = 0;
% q1d = 0;
% q2d = 0;

J_sub = eval(subs(j,{"q1","q2","q1d","q2d"},{pi/2,0,0,0}));
M_inv_sub = eval(subs(M_inv ,{"q1","q2","q1d","q2d"},{pi/2,0,0,0}));

temp = -M_inv_sub*J_sub;

A = [zeros(2,2) eye(2); temp zeros(2,2)];
B = [zeros(2,1);M_inv_sub(:,1:1)];
Q = eye(4);
R = 1;

[K,S,P] = lqr(A,B,Q,R);
