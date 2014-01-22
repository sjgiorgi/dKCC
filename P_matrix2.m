function [P_hat, P, Gamma] = P_matrix(k, N, A, B, Q, R, G, W, mu)

    % samples = final time N
    NN = N+1;

    %% Initialization
    P_hat = cell(NN,k);
    P     = cell(NN,k);
    Gamma = cell(1,NN-1);
    [n,m] = size(Q);


    %% Terminating Conditions
    % P and P_hat for t = N and k = 1
    P{NN,1} = Q;
    P_hat{NN,1} = zeros(n,n);

    %P and P_hat for t = N and k > 1
    for i = 2:k
       P{NN,i} = zeros(n,n); 
       P_hat{NN,i} = zeros(n,n);
    end

    %% Remaining i and t

    for t=NN-1:-1:1
        P_hat{t,1} = compute_P_hat(1, P_hat, P, G, W, t);
        P{t,1} = compute_P(1, P_hat, Gamma, A, B, t);
        for i = 2:k
            P_hat{t,1} = compute_P_hat(1, P_hat, P, G, W, t);   
            P{t,1} = compute_P(1, P_hat, Gamma, A, B, t);
        end
        Gamma{1,t} = compute_gamma(mu, R, A, B, P_hat, k, t);
    end
    
%     for i = 2:k
%         for t = NN-1:-1:1
%             
%              
%         end
%     end
%     Gamma{1,t} = compute_gamma(mu, R, A, B, P_hat, k, t);
%         %for i = 1:k
%             
%         %end
%         for i = 1:k
%             P_hat{t,i} = compute_P_hat(i, P_hat, P, G, W, t);
%         end
%         Gamma{1,t} = compute_gamma(mu, R, A, B, P_hat, k, t);
%         for i = 1:k
%             if i == 1
%                 P{t,i} = compute_P_1(P, Gamma, A, B, Q, R, t);
%             else
%                 P{t,i} = compute_P(i, P_hat, Gamma, A, B, t);
%             end
%         end
%     end

end