
s = tf('s');
G = 1/(s*(s+2));
rlocus(G)
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

kp1 = 0.75;
Go1 = feedback(kp1*G, 1);
kp = 2;
Go2 = feedback(kp*G, 1);
figure;
step(Go1, Go2)
set(findall(gca, 'Type', 'line'), 'LineWidth', 2)
set(gca, 'FontSize', 17, 'FontName', 'Times')


%% ejemplo 2

% Ejemplo de diseño No. 2
s = tf('s');
G = 1/(s+1);
% Primer ensayo:
Kp = 1;
Grl = 1/(s*(s+1+Kp));
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
Kp = 4;
Ki = 6.19;
C = Kp + Ki/s;
Go619 = feedback(C*G,1);
Ki = 12.8;
C = Kp + Ki/s;
Go128 = feedback(C*G,1);
figure(2), step(Go619, Go128)
set(findall(gca, 'Type', 'line'), 'LineWidth', 2)
set(gca, 'FontSize', 17, 'FontName', 'Times')
grid
