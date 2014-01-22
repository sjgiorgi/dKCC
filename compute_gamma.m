function gamma_t = compute_gamma(mu, R, A, B, P_hat, k, t)

    first_term = mu(1)*R;

    for i=1:k
        first_term = first_term + mu(i)*i*B'*P_hat{t,i}*B;
    end

    second_term = zeros(size(R));

    for i=1:k
        second_term = second_term + mu(i)*i*B'*P_hat{t,i}*A;
    end

    gamma_t = first_term\second_term;%inv(first_term)*second_term;

end