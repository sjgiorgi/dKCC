function P = calc_P(t, k, A, B, Q, R, G, W, mu, N)
    if k == 1
        if t == N
            P = Q;
        else
            gamma = calc_gamma(t, k, A, B, Q, R, G, W, mu, N);
            P = Q + gamma'*R*gamma + (A - B*gamma)'*calc_P(t+1, k, A, B, Q, R, G, W, mu, N)*(A - B*gamma);
        end
    else
        if t == N
            P = zeros(size(A));
        else
            gamma = calc_gamma(t, k, A, B, Q, R, G, W, mu, N);
            P = (A - B*gamma)'*calc_Phat(t, k, A, B, Q, R, G, W, mu, N)*(A - B*gamma);
        end
    end
end