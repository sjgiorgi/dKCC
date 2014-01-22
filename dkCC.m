function [V, p, D, P_hat, P, Gamma] = dkCC(k, N, A, B, G, W, Q, R, mu, x_0)

    %n = length(A);
    %m = size(B,2);
    %p = size(G,2);

    %nx = length(A);
    %[mx my] = size(B);
    %Q = dt*eye(nx);
    %R = dt*eye(my);

    [P_hat, P, Gamma] = P_matrix(k, N, A, B, Q, R, G, W, mu);
    D = compute_D(k, N, G, W, P);
    p = compute_small_p(k, N, D);
    V = optimal_cost(k, mu, P, p, x_0);

end