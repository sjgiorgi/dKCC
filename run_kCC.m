k = 1;  % number of cumulants, scalar
n = 2;  % size of A matrix is n x n
N = 20; % final time, scalar
A = [-0.01 0; 0 -0.02];  % state matrix, n x n
B = [1 1;-0.25 0.75];  % control matrix, n x m
C = [0.01 0; 0 1];
Q = C'*C;  % n x n matrix
R = eye(2);  % m x m matrix
G = 1;  % noise weight matrix, n x p
W = 1;  % covariance matrix, p x p
mu = ones(1,k); % k x 1 vector of weights
x_0 = ones(n,1);

[V, p, D, P_hat, P, Gamma] = dkCC(k, N, A, B, C, Q, R, G, W, mu, x_0);
