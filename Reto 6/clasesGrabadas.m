for w=0:0.01:10
s1=0+1i*w;
subplot(1,2,1)
plot(real(s1),imag(s1), '*')
title('Plano s')
grid on
hold on
axis([-1 2 -1 11])
subplot(1,2,2)
G_s1=1/(s1+0.5);
plot(real(G_s1),imag(G_s1), '*')
title('G_1(s_1)')
grid on
hold on
axis([-2 2 -2 2])
%pause(0.5)
end
%%
s=tf('s');
G_L=2*10/0.5/((s+0.5)*(s+1)*(s+5));
zpk(G_L)
w = -70:0.1:70;
figure(1), pzmap(1+G_L)
axis([-8 1 -4 4])
hold on
figure(2), nyquist(G_L,{0.6,100})
axis([-2 1 -4 4])
hold on
for k=10:5:60
    G_L=k*2/((s+0.5)*(s+1)*(s+5));
    figure(1), pzmap(1+G_L)
    axis([-8 1 -4 4])
    figure(2), nyquist(G_L,{0.6,100})
    axis([-6 1 -10 10])
    pause(0.5)
end
%%
syms w k
w = double(solve(angle(2/((w*1i+0.5)*(w*1i+1)*(w*1i+5)))==pi,w))
k = double(solve(abs(2*k/((w*1i+0.5)*(w*1i+1)*(w*1i+5)))==1,k))

%%
% Ejemplo de trabajo 1b
s=tf('s');
k=1;
G_L=k*1/(s-5);
zpk(G_L)
figure(1), pzmap(1+G_L)
axis([-20 10 -1 1])
hold on
figure(2), nyquist(G_L)
axis([-3.5 1 -2 2])
hold on
for k=1:1:7
G_L=k*2/(s-5);
figure(1), pzmap(1+G_L)
axis([-20 10 -1 1])
figure(2), nyquist(G_L)
axis([-3.5 1 -2 2])
pause(0.5)
end
%%

s=tf('s');
K_DC = 1;
w_n = 1;
zeta = 1;
G_L = K_DC/((s+1)*(s^2 + 2*zeta*w_n*s + w_n^2));
figure(1), nyquist(G_L)
axis([-3 1.5 -3 3])
hold on

for zz=1:1:8
    zeta=1/zz;
    G_L=K_DC/((s+1)*(s^2 + 2*zeta*w_n*s + w_n^2));
    figure(1), nyquist(G_L)
    axis([-3 1.5 -3 3])
    pause(0.5) 
end

%%

% Objetivo: Evidenciar conceptualmente el margen de ganancia
% y el margen de fase

s=tf('s');
k = 10/0.403;
G_L = 0.5+2*k/((s+0.5)*(s+1)*(s+5));
zpk(G_L)
w = 1.4:0.1:100;
s1=1i*w;
G1_s1 = 2*k./((s1+0.5).*(s1+1).*(s1+5));
figure(1), plot(real(0.5*G1_s1), imag(0.5*G1_s1), 'LineWidth', 2)
axis([-3 0 -2.5 0.5])
title('KG_L(C_1)')
grid on

hold on
figure(1), plot(-1, 0, '+', 'LineWidth', 2)
axis([-3 0 -2.5 0.5])

% nyquist(G_L)

for K=0.5:0.1:1.1
    G1_s1_K = K * G1_s1;
    figure(1), plot(real(G1_s1_K), imag(G1_s1_K), 'LineWidth', 2)
    pause(0.5)
end

%%
% Se dibuja semicircunferencia de radio 1

N=50;
theta=(pi/2:pi/N:(3/2)*pi);
sc1=1*exp(1i*theta);
figure(2), plot(real(sc1), imag(sc1))

grid on
hold on

figure(2), plot(real(0.5*G1_s1), imag(0.5*G1_s1), 'LineWidth', 2)
title("G_L(C_1)")

axis([-2 0 -1.5 1])
figure(2), plot(-1, 0, '+', 'LineWidth', 2)

axis([-2 0 -1.5 1])

% Se calcula el margen de fase de G_L
% margin(G_L)

PM = 18.8*(pi/180);
delta_pm = PM/5;

for P=0:delta_pm:PM
    G1_s1_P = exp(-1i*P)*0.5*G1_s1;
    figure(2), plot(real(G1_s1_P), imag(G1_s1_P), 'LineWidth', 2)
    axis([-2 0 -1.5 1])
    pause(0.5)
end

%%

s=tf('s');
k=1;
G=2/(s*(s+1)*(s+5));
G_l1=k*G;
bode(G_l1)
Go1=feedback(G_l1,1);
%step(1/s - Go1/s,25)

%%
s=tf('s');
k=1;
G=2/(s*(s+1)*(s+5));
G_l1=k*G;
figure(1), bode(G_l1), grid on
Go1=feedback(G_l1,1);
figure(2), step(1/s - Go1/s,25), grid on

k=10;
G=2/(s*(s+1)*(s+5));
G_l10=k*G;
figure(1), bode(G_l1, G_l10), grid on
Go1=feedback(G_l1,1);
figure(2), step(1/s - Go1/s,25), grid on

%%
s=tf('s');
G=100/((-s-0.01)*(s+10)*(s+1000));

figure(1), bode(G)
grid on
set(gca, 'YLim', [-250 0])  % Limitar eje Y de 0 a -250

% Eliminar la fase
set(gca, 'YTickLabel', [])

