function [Klqg,eigenlqg] = LQGController(A,B,C,D,cd, dt)
nx = length(A);
[mx my] = size(B);
Q = eye(nx);
R = 1*eye(my);
Rinv = inv(R);
if cd == 0
    % solve the algebraic Riccati equation
    P = care(A,B,Q,R);
    %calculate gain matrix
    Klqg = Rinv*B'*P;
    %eigenvalue of closed loop
    eigenlqg = eig(A-B*Klqg);
else if cd == 1
        Q = dt*eye(nx);
        R = dt*eye(my);
        [P,eigenlqg,Klqg] = dare(A,B,Q,R);
    end
end
end


