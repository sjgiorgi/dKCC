%% Code Author: Firdous Saleheen -- f.saleheen@temple.edu
% no permission necessary for non-commercial use
% Date: 7/27/2013
clear all;
close all;
clc;
format shortg

disp('start')
run LoadParameters1
run LoadnCheckModel

%% PID controller
W = 1e-3;
stoptime = 200;% seconds
ref = 15.15;
dt = 0.0001;
runs = 1;
tic
[avgstatespid, timepid] = simStatesPID(stoptime, dt, runs,W);
toc
run piddrawing

%% LQG controller

[Kplqg, elqg1] = LQGController(Ap,Bp,Cp,Dp);
[Kylqg, elqg2] = LQGController(Ayaw,Byaw,Cyaw,Dyaw);

%[Ahat,Bhat,Chat,Dhat,Khat] = buildServo(A,B,C,D,G,Klqg);

Ahat = Ap-Bp*Kplqg;
Bhat = [Bp Gp];
Chat = eye(4,4);
Dhat = zeros(4,2);
Khat = Kplqg;

Ahat1 = Ayaw-Byaw*Kylqg;
Bhat1 = [Byaw Gyaw];
Chat1 = eye(4,4);
Dhat1 = zeros(4,2);
Khat1 = Kylqg;

W = 1e-3;
stoptime = 200;% seconds
dt = 0.0001;
runs = 1;
simName = {'ltslqgservo'};
[avgstateslqg, timelqg] = simStates(stoptime, dt, runs,W,simName);

%% MCV Controller


for ii = 1:23 
%ii = 0;
W = 1e-3;
stoptime = 5;%second
dt = 0.0001;
runs = 100;
%round(100*sum(clock))
%simName = {'ltsmcvservo'};
gamma = 0.01*(ii-1);
%gamma = 0.22;
[Kpmcv, emcv1] = MCVController(Ap,Bp,Cp,Dp,Gp,W,gamma);
Ahat = Ap-Bp*Kpmcv;
Bhat = [Bp Gp];
Chat = eye(4,4);
Dhat = zeros(4,2);
Khat = Kpmcv;

%gamma = 0.01;
[Kymcv, emcv2] = MCVController(Ayaw,Byaw,Cyaw,Dyaw,Gyaw,W,gamma);
Ahat1 = Ayaw-Byaw*Kymcv;
Bhat1 = [Byaw Gyaw];
Chat1 = eye(4,4);
Dhat1 = zeros(4,2);
Khat1 = Kymcv;

simName = {'ltslqgservo'};
[avgstateslqg, timelqg] = simStates(stoptime, dt, runs,W,simName);

vertrepeat{ii} = avgstateslqg(:,1);
horzrepeat{ii} = avgstateslqg(:,7);
vertrepeaterr{ii} = avgstateslqg(:,6);
horzpeaterr{ii} = avgstateslqg(:,12);
vertrepeaterrnorm(ii) = norm(avgstateslqg(:,6));
horzpeaterrnorm(ii) = norm(avgstateslqg(:,12));
%[avgstateslqg, timelqg] = simStates(stoptime, dt, runs,W,simName);
% emcvvert(ii)=min(real(emcv1));
% emcvhorz(ii)=min(real(emcv2));
% emcvvert1(ii)=max(real(emcv1));
% emcvhorz1(ii)=max(real(emcv2));
% 
% timeinterval{ii}=timelqg(:,1);
% rmse1(ii) = norm(avgstateslqg(:,6))/sqrt(length(avgstateslqg(:,6)));
% sde1(ii)=std(avgstateslqg(:,6));
% %sde1(ii) = sqrt(avgstateslqg(:,6).*avgstateslqg(:,6)/length(avgstateslqg(:,6)) - sum(avgstateslqg(:,6))/length(avgstateslqg(:,6)));
% vertpos{ii}=avgstateslqg(:,1);
% vertposnorm(ii)=norm(avgstateslqg(:,1));
% verterr{ii}=avgstateslqg(:,6);
% vertvel{ii}=avgstateslqg(:,2);
% vertvelnorm(ii)=norm(avgstateslqg(:,2));
% vertcontrol{ii}=avgstateslqg(:,5);
% vertcontrolnorm(ii)=norm(avgstateslqg(:,5));
% 
% rmse2(ii) = norm(avgstateslqg(:,12))/sqrt(length(avgstateslqg(:,12)));
% sde2(ii)=std(avgstateslqg(:,12));
% %sde2(ii) = sqrt((avgstateslqg(:,12).*avgstateslqg(:,12))/length(avgstateslqg(:,12)) - sum((avgstateslqg(:,12))/length(avgstateslqg(:,12))));
% horzpospos{ii}=avgstateslqg(:,7);
% horzposnorm(ii)=norm(avgstateslqg(:,7));
% horzerr{ii}=avgstateslqg(:,12);
% horzvel{ii}=avgstateslqg(:,8);
% horzvelnorm(ii)=norm(avgstateslqg(:,8));
% horzcontrol{ii}=avgstateslqg(:,11);
% horzcontrolnorm(ii)=norm(avgstateslqg(:,11));
end
% rmspe1 = [1.87 rmse1];
% rmspe2 = [0.84 rmse2];
gam = 0.2:0.2:2;
figure (10)
plot(gam,rmspe1,'--o',gam,rmspe2,'--x','Linewidth', 2); grid on
legend('Vertical Root Mean Squared Pointing Error','Horizontal Root Mean Squared Pointing Error');
xlabel '\gamma'
ylabel 'Root Mean Squared Pointing Error'

gam = 0.2:0.2:2;
figure (11)
plot(gam,sde1,'--o',gam,sde2,'--x','Linewidth', 2); grid on
legend('Vertical Error SD','Horizontal Error SD');
xlabel '\gamma'
ylabel 'SD'


