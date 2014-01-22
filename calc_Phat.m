function Phat = calc_Phat(t, k, A, B, Q, R, G, W, mu, N)
    if t == N
        Phat = zeros(size(A));
    else
        first_term = calc_P(t+1, k, A, B, Q, R, G, W, mu, N);
        second_term = zeros(size(A));
        for j = 1:k-1
            second_term = second_term + ...
            nchoosek(k-2,j-1)*calc_P(t+1, j, A, B, Q, R, G, W, mu, N)*G*W*G'*calc_Phat(t, k-j, A, B, Q, R, G, W, mu, N);
        end
        
        %Phat = first_term + 2*second_term;
        Phat = first_term + 2*(k-1)*second_term;
    end
end