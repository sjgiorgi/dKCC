function P_final = compute_P(i, P_hat, Gamma, A, B, t)
    
    P_final = (A-B*Gamma{1,t})'*P_hat{t,i}*(A-B*Gamma{1,t});

end