% Declarar las variables simbólicas
syms s k0 k1 k2 k3 k4 k5

% Definir G(s) y C(s)
G = 1 / s^3;
C = (k3 * s^3 + k2 * s^2 + k1 * s + k0) / ((s + k4) * (s + k5) * s);

% Calcular Go(s)
Go = simplify((G * C) / (1 + G * C));

% Factorizar para mayor organización
Go_factorized = factor(Go);

disp('Go(s) factorizado:');
pretty(Go_factorized)

pretty(expand((s^2 + 2*0.45*s + 4)*(s + 0.45*3)^4))
expand((s^2 + 2*0.45*s + 4)*(s + 0.45*3)^4)

% Sistema de ecuaciones
eq1 = k5+k4 == 63/10;
eq2 = k5*k4 == 3959/200;

% Resolver el sistema de ecuaciones
solutions = solve([eq1, eq2], [k5, k4]);

% Mostrar los resultados
k4_s = solutions.k4;
k5_s = solutions.k5;


disp("Soluciones para k4:");
disp(k4_s);

disp("Soluciones para k5:");
disp(k5_s);
