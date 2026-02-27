syms s k0 k1 k2 k3 k4 k5
G = 1/(s+1);
C = (k5*s^5+k4*s^4+k3*s^3+k2*s^2+k1*s+k0)/(s^3*(s^2+4));
Go = simplify((G)/(1+G*C));
pretty(Go)
Go_factorized = factor(Go);

disp('Go(s) factorizado:');
pretty(Go_factorized)
% 5 polos repetidos en 13.5
sigma = 0.45;
n = 1;
m = 5;
pretty(expand((s+sigma)^n * (s+50*sigma)^m))
expand((s+sigma)^n * (s+2.5*sigma)^m)
expand(((s^2+2*sigma*s+4)*((s+3*sigma)^4)))

time_lineal = lineal(:, 1);
signal_error = lineal(:, 2);  % Error e(t)

% Figura con subgráficas
figure;
plot(time_lineal, signal_error, 'b', 'LineWidth', 1); % Error e(t)
%hold on;
%plot(time_lineal, signal_salidas, 'r', 'LineWidth', 1); % Señal opuesta (si es necesaria)
grid on;
set(gca, 'FontSize', 14, 'FontName', 'Times');
xlabel('Tiempo [s]', 'Interpreter', 'latex', 'FontSize', 14);
ylabel('Valor', 'Interpreter', 'latex', 'FontSize', 14);
%legend({'Con $d(t)$', 'Sin $d(t)$'}, 'FontSize', 12, 'Interpreter', 'latex');
title('Signal de error $e(t) = r(t)  y(t)$', 'Interpreter', 'latex', 'FontSize', 14);
ylim([-0.5, 1.6]);
xlim([0, 20]);
