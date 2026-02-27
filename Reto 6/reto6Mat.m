
%% 1
s=tf('s');
G=100/((s+0.01)*(s+10)*(s+1000));

figure(1), bodemag(G)
grid on



%% 3
% adelanto punto 3

s = tf('s');
K=40/3;
G = 1/((s)*(s + 0.8)); 
w=logspace(-1,1);
figure(2),margin(K*G,w)
figure(1),bode(K*G,w),grid
%[GM,PM,Wcg,Wcp] = margin(mag,phase,w)


% Diseño compensador en adelanto 3a
phi_m=(45+4-12.5)*pi/180
b=(1+sin(phi_m))/(1-sin(phi_m))
10*log10(b)

w_g= 5.11
w_m=w_g
T2=1/(sqrt(b)*w_m)

C2=(1+b*T2*s)/(1+T2*s)

%comp en adelanto 3a

G_o2=(K*C2*G)/(1+K*C2*G)

figure(2),margin(K*C2*G)
G_o2=minreal((K*C2*G)/(1+K*C2*G))
pole(G_o2)
step(1/s - G_o2/s,25)
feedback(C2*K*G,1)

%%

%atraso 3b

s=tf('s');
G = 1/((s)*(s + 0.8)); 
K=40/3; %se debe asignar una K que garantice esp. de e_v
% Diseño compensador en atraso con 45° se busca 129° wm = 0.65
w_g1=0.65

% Atenuación: -aten dB
aten = 26; %dB;
a=10^(-aten/20)
T1=10/(a*w_g1)
C1=(1+a*T1*s)/(1+T1*s)
figure(3),margin(K*C1*G)
G_o1=minreal((K*C1*G)/(1+K*C1*G))
pole(G_o1)

%% punto 3 c
step(G_o1);
hold on; % Mantiene la gráfica actual
step(G_o2);
grid on;
legend('Compensador en Atraso', 'Compensador en Adelanto');

%% punto 4

s = tf('s');
K=4;
G = 1/((s)*(s + 0.2)); 
n = 1;
w=logspace(-n,n);
figure(1),bode(K*G,w),grid
%[GM,PM,Wcg,Wcp] = margin(mag,phase,w)

figure(7),margin(K*G)
% Diseño compensador en adelanto +20°
phi_m=(20+1-5.72)*pi/180
b=(1+sin(phi_m))/(1-sin(phi_m))
10*log10(b)

w_g= 2.28
w_m=w_g
T2=1/(sqrt(b)*w_m)

C2=(1+b*T2*s)/(1+T2*s)

%comp en atraso

figure(7),margin(C2*K*G)
G_o2=(K*C2*G)/(1+K*C2*G)

figure(2),margin(K*C2*G)

G_o2=minreal((K*C2*G)/(1+K*C2*G))
pole(G_o2)
step(1/s - G_o2/s,25)


%%

%atraso 4

s=tf('s');
G = 1/((s)*(s + 0.2)); 
K=4; %se debe asignar una K que garantice esp. de e_v
% Diseño compensador en atraso con 45° se busca 129° wm = 0.65
w_g1=0.145

% Atenuación: -aten dB
aten=41 %dB;
a=10^(-aten/20)
T1=10/(a*w_g1)
C1=(1+a*T1*s)/(1+T1*s)
figure(3),margin(K*C1*G)
G_o1=minreal((K*C1*G)/(1+K*C1*G))
pole(G_o1)

figure(5),margin(K*C2*C1*G)
Gototal=feedback(K*C2*C1*G,1)
step(Gototal)

step(1/s - Gototal/s,500)