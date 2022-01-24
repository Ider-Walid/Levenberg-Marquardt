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

function [a,iter] = LevenbergMarquardt(x,y,M,eps)
% ┌───────────────────────────────┐
% │ IDER Walid & CORCOS LUDOVIC   │
% └───────────────────────────────┘
% ┌───────────────────────────────┐
% │ Fonction Principale           │
% └───────────────────────────────┘
    iter = 0;
    lambda = 0.001;
    a = ones(3*M,1);
    n = length(a);




    while(1)
        [F,JF1] = sgauss(x,y,a,1); % Calcul de la jacobienne via sgauss
        Norm_JF_F = norm(JF1'*F);
        d = ((JF1')*JF1+lambda*eye(n))\((-JF1')*F);
        [F_b,~] = sgauss(x,y,a+d,1);
        e_a = (1/2)*(F')*F; %% Erreur
        e_d = (1/2)*(F_b')*F_b;  %% Erreur
        if(e_d<e_a)
            lambda = lambda/10; %% on recule lambda
            a = a + d;
        else
            lambda = lambda*10; %% On avance lambda
        end
        iter = iter + 1;





        if(Norm_JF_F<eps) %% Trigger pour mettre fin à l'algorithme
            break;
        end




        
    end
end
