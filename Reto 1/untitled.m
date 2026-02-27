

% Título global
%sgtitle('Análisis del Sistema: Error y Respuesta', 'FontSize', 16, 'Interpreter', 'latex');

% Extraer datos
time_salidas = salidas(:, 1);
signal_salidas = salidas(:, 2);

time_lineal = lineal(:, 1);
signal_error = lineal(:, 2);  % Error e(t)

% Figura con subgráficas
figure;
plot(time_lineal, signal_error, 'b', 'LineWidth', 1); % Error e(t)
hold on;
plot(time_lineal, signal_salidas, 'r--', 'LineWidth', 1); % Señal opuesta (si es necesaria)
grid on;
set(gca, 'FontSize', 14, 'FontName', 'Times');
xlabel('Tiempo [s]', 'Interpreter', 'latex', 'FontSize', 14);
ylabel('Valor', 'Interpreter', 'latex', 'FontSize', 14);
legend({'Con $d(t)$', 'Sin $d(t)$'}, 'FontSize', 12, 'Interpreter', 'latex');
title('Respuesta ante referencia $r(t) = u(t)$ con y sin saturacion ($d(t) = t u(t)$)', 'Interpreter', 'latex', 'FontSize', 14);
ylim([0, 1.25]);
xlim([0, 1.2]);

