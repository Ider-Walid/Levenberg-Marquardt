% ┌───────────────────────────────────────────────────────────────────────────────────────────────┐
% │                               Méthode de Levenberg Marquardt                                  │
% ├───────────────────────────────────────────────────────────────────────────────────────────────┤
% │ Créé par : Corcos Ludovic et Ider Walid - ZZ2 F4                                              │
% │                                                                                               │
% │ La méthode de Levenberg-Marquardt permet de résoudre des problèmes de minimisation. Il combine│
% │ les algorithmes de Gauss-Newton et du gradient (plus forte pente).                            │
% │                                                                                               │
% │ Le fichier notebook "Script.mlx" permet de fournir un test complet et détaillé de             │
% │ l'exécution de notre algorithme d'ajustement.                                                 |
% └───────────────────────────────────────────────────────────────────────────────────────────────┘


eps = 10^-4;
X = [0.01 1.93 2.95 3.26 4.18 5.73 6.29 7.70 8.91 9.12]';
Y = [0.98 0.84 0.80 0.78 0.82 0.78 0.80 0.85 0.90 0.95]';
Longueur = length(X);
Intervalle = X(1):0.1:X(Longueur);
M =55;
[A_ER,~] = LevenbergMarquardt(X,Y,M,eps); 
Y_ER=sgauss(Intervalle,Y,A_ER,0);
plot(X,Y,'r*',Intervalle,Y_ER,'m');
legend('Echantillon','Ajustement pour M=55')
xlabel('X');
ylabel('Y');
title('Ajustement erroné pour M=55');