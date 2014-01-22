function D = compute_D(k, N, G, W, P)
    D = cell(N+1, k);
    [n,m] = size(G);
    
    for i = 1:k
       D{N+1,i} = zeros(n,n); 
    end
    
    
    for t = N:-1:1
        for i = 1:k
            final_term = zeros(n,n);
            if i == 1
                D{t,i} = P{t+1,i}*G*W*G';
            else
                
                for j = 1:(i-1)
                   final_term = final_term + nchoosek(i-2,j-1)*P{t+1,j}*G*W*G'*D{t,i-j}; 
                end
                D{t,i} = i*P{t+1,i}*G*W*G' + 2*(i-1)*final_term;
            end
        end
    end
    
end