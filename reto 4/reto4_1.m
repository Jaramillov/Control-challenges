

%{ 
con 3 segundo orden
k5 = (63/10)-1;
k4 = (3959/200)-4;
k3 = (41283/1000)-4;
k2 = 8947017/160000;
k1 = 67768569/1600000;
k0 = 531441/40000;

con 3 primer orden
k5 = (36/5)-1;
k4 = (1701/80)-4;
k3 = (6561/200)-4;
k2 = 177147/6400;
k1 = 4782969/400000;
k0 = 129140163/64000000;

con 2.5 segundo orden
k5 = (27/5)-1;
k4 = (2503/160)-4;
k3 = (19539/640)-4;
k2 = 759861/20480;
k1 = 992169/40960;
k0 = 6561/1024;
%} 
k5 = (63/10)-1;
k4 = (3959/200)-4;
k3 = (41283/1000)-4;
k2 = 8947017/160000;
k1 = 67768569/1600000;
k0 = 531441/40000;
s = tf('s');
G = 1/(s+1);
C = (k5*s^5+k4*s^4+k3*s^3+k2*s^2+k1*s+k0)/(s^3*(s^2+4));
Go = feedback(G*C,1)
Gyd = s^3*(s^2+4) / ((s+1)*s^3*(s^2+4) + (k5*s^5+k4*s^4+k3*s^3+k2*s^2+k1*s+k0))
Gyd1 = ((G) / (1 + (G*C)))

% Simplificación de Gyd1
Gyd1_simplified = minreal(Gyd1);

% Mostrar el resultado
disp('Gyd1 simplificada:');
Gyd1_simplified
pole(Go)
zero(Go)

