s = tf('s');
G = 1/(s*s + 3*s + 10);
rlocus(G)
rltool(G)
set(findall(gca, 'Type', 'line'), 'LineWidth', 2)
hold on

%%
sgrid
%%
sgrid(0.7, 2)
set(findall(gca, 'Type', 'line'), 'LineWidth', 2)
%%
t_s = 9;
sigma = 4.5/t_s;
ts_line = sigma + (-1.5:1.5:1.5) * 1i;
plot(ts_line, '--r', 'LineWidth', 2)

%%

kp1 = 68;
Go1 = feedback(kp1 * G, 1);  % Sistema en lazo cerrado con kp1

kp2 = 1;
Go2 = feedback(kp2 * G, 1);  % Sistema en lazo cerrado con kp2

t = 0:0.01:5;  % Definir el tiempo de simulación
u = ones(size(t));  % Escalón unitario

% Obtener la respuesta al escalón de ambos sistemas
[y1, t1] = step(Go1, t);
[y2, t2] = step(Go2, t);

figure;
hold on;
plot(t, u, 'k--', 'LineWidth', 1.5)  % Entrada escalón en línea negra punteada
plot(t1, y1, 'b', 'LineWidth', 1.5)  % Respuesta con kp1 en azul
plot(t2, y2, 'r', 'LineWidth', 1.5)  % Respuesta con kp2 en rojo

legend('referencia u(t)', 'Salida con kp = 68', 'Salida con kp = 1', 'Location', 'best')
set(gca, 'FontSize', 12, 'FontName', 'Times')
grid on;
title('Respuesta al Escalón Unitario')
xlabel('Tiempo (s)')
ylabel('Amplitud')
hold off;


%% ejemplo 2

% Ejemplo de diseño No. 2
s = tf('s');
G = 1/((s + 0.8)*s);
% Primer ensayo:
Kp = 1;
Grla = 1/(s^3 + 5.8*s^2 + 5*s);
Grlb = (s^2 + 0.8*s)/(s^3 + 0.8*s^2 + s + 5);

%%
set(findall(gca, 'Type', 'line'), 'LineWidth', 2)
set(gca, 'FontSize', 17, 'FontName', 'Times')
axis([-3.5 1 -4 4])
hold on

sgrid(0.7, 3)
set(findall(gca, 'Type', 'line'), 'LineWidth', 2)

t_s = 2;

sigma = 4.5/t_s;
ts_line = -sigma + (-4:1:4)*1i;
plot(ts_line, '--r', 'LineWidth', 2)
rlocus(Grlb)
rltool(Grlb)

%%
a = 1.175;
C1 = (s + a)/(s + 5);
Go1175 = feedback(C1*G,1)

a = 1.35;
C1 = (s + a)/(s + 5);
Go13562 = feedback(C1*G,1);

a = 1.6;
C1 = (s + a)/(s + 5);
Go05 = feedback(C1*G,1);

figure(2), step(Go1175, Go13562, Go05)
legend('a = 1.175', 'a = 1.35', 'a = 1.6') % Se agrega la leyenda
set(findall(gca, 'Type', 'line'), 'LineWidth', 2)
set(gca, 'FontSize', 12, 'FontName', 'Times')
grid

%%

b = 29.112;
C2 = (s + 5)/(s + b);
Go29112 = feedback(C2*G,1);

b = 23;
C2 = (s + 5)/(s + b);
Go23 = feedback(C2*G,1);

b = 18;
C2 = (s + 5)/(s + b);
Go35 = feedback(C2*G,1);

figure(2), step(Go29112, Go23, Go35)
legend('b = 29.112', 'b = 23', 'b= 18') % Se agrega la leyenda
set(findall(gca, 'Type', 'line'), 'LineWidth', 2)
set(gca, 'FontSize', 12, 'FontName', 'Times')
grid

%% ejemplo 3

% Ejemplo de diseño No. 3
s = tf('s');
G = 1/(s + 0.5);
% Primer ensayo:
Kp = 4.5;
Grl = 1/(s*(s+0.5+Kp));
rlocus(Grl)
set(findall(gca, 'Type', 'line'), 'LineWidth', 2)
set(gca, 'FontSize', 17, 'FontName', 'Times')
axis([-3.5 1 -4 4])
hold on

sgrid(0.7, 3)
set(findall(gca, 'Type', 'line'), 'LineWidth', 2)

t_s = 2;

sigma = 4.5/t_s;
ts_line = -sigma + (-4:1:4)*1i;
plot(ts_line, '--r', 'LineWidth', 2)
rlocus(Grl)
rltool(Grl)
%%
G = 1/(s + 0.5);

Kp = 5;
Ki = 7.31;
C = Kp + Ki/s;
Go1 = feedback(C*G,1);

Ki = 4;
C = Kp + Ki/s;
Go2 = feedback(C*G,1);

Ki = 7.56;
C = Kp + Ki/s;
Go8 = feedback(C*G,1);

figure(2), step(Go1, Go2, Go8)

set(findall(gca, 'Type', 'line'), 'LineWidth', 2)
set(gca, 'FontSize', 12, 'FontName', 'Times')
grid

%%

G = 1/(s + 0.5);

Kp = 4.5;
Ki = 6.19;
C = Kp + Ki/s;
Go1 = feedback(C*G,1)
Gc=C/(1+G*C);
pole(Go1)
zero(Go1)


figure(2), step(Go1, Gc)

set(findall(gca, 'Type', 'line'), 'LineWidth', 2)
set(gca, 'FontSize', 12, 'FontName', 'Times')
grid


