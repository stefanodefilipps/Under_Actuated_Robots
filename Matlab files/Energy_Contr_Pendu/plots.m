%% Plots

deg = 180/pi;
t = out.state.time;

state_sq = out.state.signals.values;
q1 = state_sq(:,1)*deg;
q2 = state_sq(:,2)*deg;

figure(1)
plot(t,q1)
hold on
plot(t,q2)
grid on
xlabel('Time [s]')
ylabel('Angle [deg]')
legend('q1','q2')

figure(2)
plot(out.q2.Data,out.q2d.Data, 'r'); % Phase of system
xlabel('q_2 [rad]')
ylabel('qd_2 [rad.s^{-1}]')

figure(3)
plot(t, out.Energy.signals.values, 'b') % Energy of the system
xlabel('Time [s]')
ylabel('Energy [J]')