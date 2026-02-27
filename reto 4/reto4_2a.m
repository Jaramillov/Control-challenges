%{ 
repetidos en 0.1
k0 = 1/1000;
k1 = 3/100;
k2 = 3/10; %da 2

repetidos en 1
k0 = 1;
k1 = 3;
k2 = 3; %da 2.25

repetidos en 3
k0 = 27;
k1 = 27;
k2 = 9;

repetidos en 7
k0 = 343;
k1 = 147;
k2 = 21;

repetidos en 10
k0 = 1000;
k1 = 300;
k2 = 30;

%Declarar las variables simbólicas
syms s k0 k1 k2 

% Definir G(s) y C(s)
G = 1 / (s);
C = (k2 * s^2 + k1 * s + k0) / (s^2);

% Calcular Go(s)
Go = simplify((G * C) / (1 + G * C));

% Factorizar para mayor organización
Go_factorized = factor(Go);

disp('Go(s) factorizado:');
pretty(Go_factorized)

pretty(expand((s + 3)^3))
expand((s + 3)^3)
%}

%{
k0 = 27;
k1 = 27;
k2 = 9;
s = tf('s');
G = 1 / (s);
C = (k2 * s^2 + k1 * s + k0) / (s^2);
Go = feedback(G*C,1)
pole(Go)
%}

k0 = 27/1000;
k1 = 27/100;
k2 = 9/10; 

s = tf('s');
G = 1 / (s);
C = (k2 * s^2 + k1 * s + k0) / (s^2);
Go = feedback(G*C,1)
pole(Go)