%% Code Author: Firdous Saleheen -- f.saleheen@temple.edu
% no permission necessary for non-commercial use
% Date: 7/27/2013
clear all;
close all;
clc;
%format shortg

disp('start')
run LoadParameters1
run LoadnCheckModel

ref = 15.15;
W = 1e-3;
stoptime = 5;% seconds
dt = 0.0001;
N = 15000;
runs = 1;
k = 2;
cumulant_runs = 10;

x_0_p = [2 0 0 0];
x_0_yaw = [2 0 0 0];

rmse_h = zeros(k,cumulant_runs);
rmse_v = zeros(k,cumulant_runs);

% plotting stuff
color = ['y', 'm', 'c', 'r', 'g', 'b', 'k'];
plots = cell(2,k);

%% PID controller

tic
[avgstatespid, timepid] = simStatesPID(stoptime, dt, runs,W);
toc
run piddrawing

%% LQG controller

% continuous system
[Kplqg, elqg1] = LQGController(Ap,Bp,Cp,Dp,0,dt);
Ahat = Ap-Bp*Kplqg;
Bhat = [Bp Gp];
Chat = eye(4,4);
Dhat = zeros(4,2);
Khat = Kplqg;

[Kylqg, elqg2] = LQGController(Ayaw,Byaw,Cyaw,Dyaw,0,dt);
Ahat1 = Ayaw-Byaw*Kylqg;
Bhat1 = [Byaw Gyaw];
Chat1 = eye(4,4);
Dhat1 = zeros(4,2);
Khat1 = Kylqg;

simName = {'ltslqgservo'};
[avgstateslqg, timelqg] = simStates(stoptime, dt, runs,W,simName);

% discrete system
[Ap_d, Bp_d, Cp_d, Dp_d, Gp_d] = convertToDiscrete(Ap,Bp,Cp,Dp,Gp,dt);
[Kplqg_d, elqg1_d] = LQGController(Ap_d,Bp_d,Cp_d,Dp_d,1, dt);
Ahat_d = Ap_d-Bp_d*Kplqg_d;
Bhat_d = [Bp_d Gp_d];
Chat_d = eye(4,4);
Dhat_d = zeros(4,2);
Khat_d = Kplqg_d;

[Ayaw_d, Byaw_d, Cyaw_d, Dyaw_d, Gyaw_d] = convertToDiscrete(Ayaw,Byaw,Cyaw,Dyaw,Gyaw,dt);
[Kylqg_d, elqg2_d] = LQGController(Ayaw_d,Byaw_d,Cyaw_d,Dyaw_d,1, dt);
Ahat1_d = Ayaw_d-Byaw_d*Kylqg_d;
Bhat1_d = [Byaw_d Gyaw_d];
Chat1_d = eye(4,4);
Dhat1_d = zeros(4,2);
Khat1_d = Kylqg_d;

simName = {'ltslqgservo_dis'};
[avgstateslqg, timelqg] = simStates(stoptime, dt, runs,W,simName);

%[Hcumulants] = MCVController(Ap,Bp,Cp,Dp,Gp,W,mu,k);
%% kCC Controller

%mu = 0.01*ones(1,k);
[gamma, P] = calc_gamma(0, k, Ap_d, Bp_d, Q_d, R_d, Gp_d, W, mu, 10);


[Ap_d, Bp_d, Cp_d, Dp_d, Gp_d] = convertToDiscrete(Ap,Bp,Cp,Dp,Gp,dt);
[Ayaw_d, Byaw_d, Cyaw_d, Dyaw_d, Gyaw_d] = convertToDiscrete(Ayaw,Byaw,Cyaw,Dyaw,Gyaw,dt);
nx = length(Ap_d);
[mx my] = size(Bp_d);
Q_d = dt*eye(nx);
R_d = dt*eye(my);
phatsss = cell(k,k);
phatss2 = cell(k,k);
for jj = 1:k
    for ii = 1:cumulant_runs 
        
        if ii == 1
            plots{1,jj} = figure;
            plots{2,jj} = figure;
        end
        mu = ones(1,k);
        for ii = 1:k
            mu(ii) = 0.1*ii;
        end
        %mu(jj) = 0.1*ii;
        [Hcumulants] = MCVController(Ap,Bp,Cp,Dp,Gp,W,mu,k);
        [Vp, pp, Dp, P_hatp, Pp, Gammap] = dkCC(k, N, Ap_d, Bp_d, Gp_d, W, Q_d, R_d, mu, x_0_p');
        Ahat_d = Ap_d-Bp_d*Gammap{1};
        Bhat_d = [Bp_d Gp_d];
        Chat_d = eye(4,4);
        Dhat_d = zeros(4,2);
        Khat_d = Gammap{1};
        %for kk = 1:jj
        %    phatsss{kk,jj} = P_hatp{1,1};
        %    phatss2{kk,jj} = Hcumulants{kk};
        %end
        
        [Vyaw, pyaw, Dyaw, P_hatyaw, Pyaw, Gammayaw] = dkCC(jj, N, Ayaw_d, Byaw_d, Gyaw_d, W, Q_d, R_d, mu, x_0_yaw');
        Ahat1_d = Ayaw_d-Byaw_d*Gammayaw{1};
        Bhat1_d = [Byaw_d Gyaw_d];
        Chat1_d = eye(4,4);
        Dhat1_d = zeros(4,2);
        Khat1_d = Gammayaw{1};

        simName = {'ltslqgservo_dis'};
        [avgstateslqg, timelqg] = simStates(stoptime, dt, runs,W,simName);
        
        run drawStates
    end
end
