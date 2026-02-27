% Representación en espacio de estado

syms a0 a1 a2 b0 s
% Primera representación
A = [  0   1   0;
       0   0   1;
      -a0 -a1 -a2];

B = [0;
     0;
     b0];

C = [1 0 0];

D = 0;

P = [1 0 0;
     1 1 0;
     1 1 1];

P_inv = inv(P);

% Ecuación característica
det(s * eye(3) - A)

% Función de transferencia asociada
G1 = C * inv(s * eye(3) - A) * B + D;

% Segunda representación
%x_ = P * x;

A_ = P * A * P_inv;
B_ = P * B;
C_ = C * P_inv;
D_ = D;

%% Control por realimentación de estados
syms k1 k2 k3
K = [k1 k2 k3];

Ac = A - B * K;

pol_c = collect(det(s * eye(3) - Ac), s) 


%%
A = [2 1 ; 0 -6];
B = [0; 1];
C = [1 0];

% Controlabilidad y observabilidad
Controlabilidad = ctrb(A, B);
Observabilidad = obsv(A, C);

rank(Controlabilidad)
det(Controlabilidad)
rank(Observabilidad)

%%% Diseño de control
K = acker(A, B, [-10 -10]);
L = acker(A', C', [-30 -30])';


%%
syms s l1 l2
% Sistema de ecuaciones
eq1 = 4 + l1 == 4.5;
eq2 = 6*l1 + l2 -12 == 10.33163;

% Resolver el sistema de ecuaciones
solutions = solve([eq1, eq2], [l1, l2]);

% Mostrar los resultados
l1_s = solutions.l1;
l2_s = solutions.l2;


disp("Soluciones para l1:");
disp(l1_s);

disp("Soluciones para l2:");
disp(double(l2_s));