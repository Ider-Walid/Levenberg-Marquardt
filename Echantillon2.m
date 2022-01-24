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
X = [0.9 1.3 1.9 2.1 2.6 3.0 3.9 4.4 4.7 5.0 6.0 7.0 8.0 9.2 10.5 11.3 11.6 12.0 12.6 13.0 13.3]';
Y = [1.3 1.5 1.85 2.1 2.6 2.7 2.4 2.15 2.05 2.1 2.25 2.3 2.25 1.95 1.4 0.9 0.7 0.6 0.5 0.4 0.25]';
Longueur = length(X);
Intervalle = X(1):0.1:X(Longueur);
M = [1,2,3,4];

[a1,~] = LevenbergMarquardt(X,Y,M(1),eps); 
[a2,~] = LevenbergMarquardt(X,Y,M(2),eps); 
[a3,~] = LevenbergMarquardt(X,Y,M(3),eps); 
[a4,~] = LevenbergMarquardt(X,Y,M(4),eps); 

Y1=sgauss(Intervalle,Y,a1,0);
Y2=sgauss(Intervalle,Y,a2,0);
Y3=sgauss(Intervalle,Y,a3,0);
Y4=sgauss(Intervalle,Y,a4,0);

plot(X,Y,'r*',Intervalle,Y1,Intervalle,Y2,Intervalle,Y3,Intervalle,Y4);
legend('Echantillon','Ajustement pour M=1','Ajustement pour M=2','Ajustement pour M=3','Ajustement pour M=4');
xlabel('X');
ylabel('Y');
title('Ajustement de Levenberg pour le deuxième échantillon');
