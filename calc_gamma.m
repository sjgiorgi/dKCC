function [gamma, P] = calc_gamma(t, k, A, B, Q, R, G, W, mu, N)
    P = cell(1,k);
    if t == N
        gamma = zeros(size(R));
    else
        first_term = mu(1)*R;
        second_term = zeros(size(R));
        for i = 1:k
            P{1,i} = calc_Phat(t+1, i, A, B, Q, R, G, W, mu, N);
            first_term = first_term + mu(i)*i*B'*P{1,i}*B;
        end
        
        for i = 1:k
            second_term = second_term + mu(i)*B'*P{1,i}*A;
        end
        gamma = inv(first_term)*second_term;
    end
    
end