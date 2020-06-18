%% LQR for Acrobot in Up-Up position

syms q1 q2 qd1 qd2
syms d11 d12 d21 d22

% Inertia Matrix 

d11 = m1*lc1^2 + m2*(l1^2 + lc2^2+2*l1*lc2*cos(q2)) + I1 + I2;
d12 = m2*(lc2^2 + l1*lc2*cos(q2)) + I2;
d21 = d12;
d22 = m2*lc2^2 + I2;

D = [d11, d12; d21, d22];

% Coriolis and Centrifugal terms

h1 = -m2*l1*lc2*sin(q2)*qd2^2 - 2*m2*l1*lc2*sin(q2)*qd2*qd1;
h2 = m2*l1*lc2*sin(q2)*qd1^2;

H = [h1; h2];

% Gravity terms

phi1 = (m1*lc1 + m2*l1)*g*cos(q1) + m2*lc2*g*cos(q1+q2);
phi2 = m2*lc2*g*cos(q1+q2);

Phi = [phi1; phi2];

% Linearized Model

J = jacobian(Phi,[q1;q2]);
J_e = eval(subs(J,{q1,q2},{pi/2,0}));

Minv_e = eval(subs(inv(D),{q1,q2},{pi/2,0}));

A = [zeros(2,2), eye(2);
     -Minv_e*J_e, zeros(2,2)];
 
B = [zeros(2,1);
    Minv_e*[0;1]];

Q = eye(4); % Regulation Cost
R = 1; % Control effort cost

[K,S,P] = lqr(A,B,Q,R);

