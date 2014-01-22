function P_final = compute_P_1(P, Gamma, A, B, Q, R, t)
    
    P_final = Q + Gamma{1,t}'*R*Gamma{1,t} + (A-B*Gamma{1,t})'*P{t+1,1}*(A-B*Gamma{1,t});

end