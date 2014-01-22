function V = optimal_cost(k, mu, P, p, x_0)
    
    [n,m] = size(x_0);
    first_term = zeros(n,n);
    second_term = 0;
    
    for i = 1:k
       first_term = first_term + mu(i)*i*P{1,i}; 
    end
    
    for i = 1:k
       second_term = mu(i)*i*p(1,i); 
    end
    
    V = x_0'*first_term*x_0 + second_term;

end
