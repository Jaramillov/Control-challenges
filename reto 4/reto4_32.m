
s = tf('s');
k0_s = 10000000;
k1_s = 7000000;
k2_s = 2100000;
k3_s = 347901;
k4_s = 34930;
k5_s = 35 - 874^(1/2)*1i;
k6_s = 35 + 874^(1/2)*1i;
G = 1 / s^3;
C = (k4_s * s^4 + k3_s * s^3 + k2_s * s^2 + k1_s * s + k0_s) / ((s + k5_s) * (s + k6_s) * (s^2 + 1))
Go = feedback(G*C,1)
pole(Go)

time_lineal = lineal(:, 1);
signal_perturbacion = lineal(:, 2);  
signal_salida = lineal(:, 3); 
signal_referencia = lineal(:, 4);  

% Figura con subgráficas
figure;
plot(time_lineal, signal_perturbacion, 'b', 'LineWidth', 1); % Error e(t)
hold on;
plot(time_lineal, signal_salida, 'r', 'LineWidth', 1); 
hold on;
plot(time_lineal, signal_referencia, 'm', 'LineWidth', 1);
grid on;
set(gca, 'FontSize', 14, 'FontName', 'Times');
xlabel('Tiempo [s]', 'Interpreter', 'latex', 'FontSize', 14);
ylabel('Valor', 'Interpreter', 'latex', 'FontSize', 14);
legend({'$y(t)$', '$d(t)$', '$r(t)$'}, 'FontSize', 12, 'Interpreter', 'latex');
title('Signal de salida $y(t)$, perturbacion $d(t)$ y referencia $r(t)$', 'Interpreter', 'latex', 'FontSize', 14);
ylim([-1, 51]);
xlim([0, 20]);
