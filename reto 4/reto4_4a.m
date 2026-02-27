% Declarar las variables simbólicas
syms s k0 k1 k2 k3 k4 k5 k6

% Definir G(s) y C(s)
G = 1 / (s + 2);
C = (k6 * s^6 + k5 * s^5 + k4 * s^4 + k3 * s^3 + k2 * s^2 + k1 * s + k0) / (s^6);

% Calcular Go(s)
Go = simplify((G * 1) / (1 + G * C));

% Factorizar para mayor organización
Go_factorized = factor(Go);

disp('Go(s) factorizado:');
pretty(Go_factorized)

pretty(expand((s + 10)^7))
expand((s + 10)^7)
