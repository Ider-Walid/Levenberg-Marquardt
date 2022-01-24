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

function [F,JF] = sgauss(x,y,a,flag)
% ┌───────────────────────────────┐
% │ IDER Walid & CORCOS LUDOVIC   │
% └───────────────────────────────┘
% ┌───────────────────────────────┐
% │ Fonction de calcul de F et JF │
% └───────────────────────────────┘



    p = length(x);
    n = length(a);
    M = n/3;
    F = zeros(p,1);
    JF = zeros(p,n);




    for i=1:p
        for l=1:M
            F(i) = F(i) + a(3*l-2) * exp(-((x(i)-a(3*l-1))/a(3*l))^2); %% Calcul des F_i
        end



        if flag == 1
            F(i) = F(i) - y(i);
        end
    end



    for i=1:p %% Calcul des dérivées puis de la jacobienne
        for j=1:M
            TEMP = exp(-((x(i)-a(3*j-1))/a(3*j))^2); %% Cette expression se repete dans les dérivées
            JF(i,3*j-2) = TEMP;
            JF(i,3*j-1) = 2*(a(3*j-2)/a(3*j))*((x(i)-a(3*j-1))/a(3*j))*TEMP;
            JF(i,3*j) = 2*a(3*j-2)*((x(i)-a(3*j-1))^2/a(3*j)^3)*TEMP;
        end
    end

end