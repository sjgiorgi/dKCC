function P_hat_final = compute_P_hat(i, P_hat, P, G, W, t)
    
    %P_hat_first = P{t+1,i};
    [n,m] = size(P{t+1,i});
    final_term = zeros(n,n);
    if i == 1
        P_hat_final = P{t+1,1};
    else
        for j = 1:(i-1)
            final_term = final_term + nchoosek(i-2,j-1)*P{t+1,j}*G*W*G'*P_hat{t,i-j};
        end
        P_hat_final = P{t+1,i} + 2*(i-1)*final_term;
    end
end