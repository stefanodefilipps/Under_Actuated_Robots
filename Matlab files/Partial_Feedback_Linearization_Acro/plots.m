%% Plots

deg = 180/pi;
t = state.time;

state_sq = squeeze(state.signals.values);
q1 = state_sq(1,:)*deg;
q2 = state_sq(2,:)*deg;

figure(1)
plot(t,q1)
hold on
plot(t,q2)
grid on
xlabel('Time [s]')
ylabel('Angle [deg]')
legend('q1','q2')