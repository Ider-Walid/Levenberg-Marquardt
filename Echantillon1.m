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
M = [2,3,4];

[a1,~] = LevenbergMarquardt(X,Y,M(1),eps); 
[a2,~] = LevenbergMarquardt(X,Y,M(2),eps); 
[a3,~] = LevenbergMarquardt(X,Y,M(3),eps); 

Y1=sgauss(Intervalle,Y,a1,0);
Y2=sgauss(Intervalle,Y,a2,0);
Y3=sgauss(Intervalle,Y,a3,0);

plot(X,Y,'r*',Intervalle,Y1,'m',Intervalle,Y2,'b',Intervalle,Y3,'g');
legend('Echantillon','Ajustement pour M=2','Ajustement pour M=3','Ajustement pour M=4');
hold on;
xlabel('X');
ylabel('Y');
title('Ajustement de Levenberg pour le premier échantillon');
