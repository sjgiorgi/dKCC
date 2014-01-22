function p = compute_small_p(k, N, D)

    p = zeros(N+1,k);
    for i = 1:k
        for t = N:-1:1
            p(t,i) = p(t+1,i) + trace(D{t,i});
        end
    end

end