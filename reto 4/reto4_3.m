% Declarar las variables simbólicas
syms s k0 k1 k2 k3 k4 k5 k6

% Definir G(s) y C(s)
G = 1 / s^3;
C = (k4 * s^4 + k3 * s^3 + k2 * s^2 + k1 * s + k0) / ((s + k5) * (s + k6) * (s^2 + 1));

% Calcular Go(s)
Go = simplify((G * C) / (1 + G * C));

% Factorizar para mayor organización
Go_factorized = factor(Go);

disp('Go(s) factorizado:');
pretty(Go_factorized)

expand((s+10)^7)

% Sistema de ecuaciones
eq1 = k5+k6 == 70;
eq2 = k4+k5+k6 == 35000;
eq3 = k5*k6+1 == 2100;
eq4 = k5*k6+k3 == 350000;

% Resolver el sistema de ecuaciones
solutions = solve([eq1, eq2, eq3, eq4], [k6, k5, k4, k3]);

% Mostrar los resultados
k0_s = 10000000;
k1_s = 7000000;
k2_s = 2100000;
k3_s = solutions.k3;
k4_s = solutions.k4;
k5_s = solutions.k5;
k6_s = solutions.k6;


disp("Soluciones para k3:");
disp(k3_s);

disp("Soluciones para k4:");
disp(k4_s);

disp("Soluciones para k5:");
disp(k5_s);

disp("Soluciones para k6:");
disp(k6_s);



% Declarar las variables simbólicas
syms s k0 k1 k2 k3 k4 k5 k6

% Definir G(s) y C(s)
G = 1 / (s)^2;
C = (k3 * s^3 + k2 * s^2 + k1 * s + k0) / ((s + k5) * (s^2 + 1));

% Calcular Go(s)
Go = simplify((G * C) / (1 + G * C));

% Factorizar para mayor organización
Go_factorized = factor(Go);

disp('Go(s) factorizado:');
pretty(Go_factorized)