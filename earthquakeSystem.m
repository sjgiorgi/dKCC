% earthquake model

% single degree of freedom example
%if DOF == 1
    mm = 16.69;  % lb-sec^2/in
    cc = 9.020;  % lb-sec/in
    kk = 7934;   % lb/in
    kkc = 2124;  % lb/in
    alpha = 36;  % degrees

    A_single = [0 1; -kk/mm -cc/mm];
    B_single = [0; -4*kkc*cos(alpha)/mm];
    C_single = eye(2);
    D_single = 0;
    G_single = [0; 1];
    W_single = 1.0*2*pi;

    Q_single = [kk 0; 0 0];
    R_single = kkc;
%else if DOF == 3
        m1 = 5.6;
        m2 = 5.6;
        m3 = 5.6;
        c1 = 2.6;
        c2 = 6.3;
        c3 = 0.35;
        k1 = 5034.0;
        k2 = 10965;
        k3 = 6135;
        kkc = 2124;
        alpha = 36;
        
        Ms = [m1 0 0; 0 m2 0; 0 0 m3];
        Bs = [-4*kkc*cos(alpha); 0; 0];
        Cs = [c1+c2 -c2 0; -c2 c2+c3 -c3; 0 -c3 c3];
        Gammas = [1; 1; 1];
        Ks = [k1+k2 -k2 0; -k2 k2+k3 -k3; 0 -k3 k3];
        
        A_triple = [zeros(3) eye(3); -inv(Ms)*Ks -inv(Ms)*Cs];
        B_triple = [zeros(3,1); inv(Ms)*Bs];
        C_triple = eye(6);
        D_triple = 0;
        G_triple = [zeros(3,1); -Gammas];
        W_triple = 1.0*2*pi;

        Q_triple = Ks;
        R_triple = kkc;
    %end