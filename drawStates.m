%% Vertical and Horizontal Position

figure(plots{1,jj})
subplot(2,1,1);
state1  = plot(timelqg(:,1),avgstateslqg(:,1));
grid on;
set(state1                , ...
  'LineStyle'       , '--'        , ...
  'Color'           , color(mod(ii-1,length(color))+1)        , ...
  'DisplayName'           , num2str(mu(jj))        , ...
  'LineWidth'       , 2          );

hXLabel = xlabel('Time (second)' , 'FontName'   , 'Times New Roman' ,...
  'FontSize'   , 14 , 'FontWeight', 'bold'                    );
hYLabel = ylabel('Vertical Position (cm)', 'FontName'   , 'Times New Roman' ,...
  'FontSize'   , 14 , 'FontWeight', 'bold'                      );
hTitle = title([' Number of cumulants k = ' num2str(jj)], 'FontName'   , 'Times New Roman' ,...
  'FontSize'   , 14 , 'FontWeight', 'bold'                      );
set(gcf, 'color', 'white');
set(gca, ...
  'FontName'   , 'Times New Roman' ,...
  'FontSize'   , 14 , 'FontWeight', 'bold');
hold on
subplot(2,1,2);
state5  = plot(timelqg(:,1),avgstateslqg(:,7));
grid on;
set(state5                , ...
  'LineStyle'       , '-'        , ...
  'Color'           , color(mod(ii-1,length(color))+1)        , ...
  'DisplayName'           , num2str(mu(jj))        , ...
  'LineWidth'       , 2          );

hXLabel = xlabel('Time (second)' , 'FontName'   , 'Times New Roman' ,...
  'FontSize'   , 14 , 'FontWeight', 'bold'                    );
hYLabel = ylabel('Horizontal Position (cm)', 'FontName'   , 'Times New Roman' ,...
  'FontSize'   , 14 , 'FontWeight', 'bold'                      );
hTitle = title([' Number of cumulants k = ' num2str(jj)], 'FontName'   , 'Times New Roman' ,...
  'FontSize'   , 14 , 'FontWeight', 'bold'                      );
set(gca, ...
  'FontName'   , 'Times New Roman' ,...
  'FontSize'   , 14 , 'FontWeight', 'bold');
hold on

%% Pointing Error
rmse1 = norm(avgstateslqg(:,6))/sqrt(length(avgstateslqg(:,6)));
rmse_v(jj,ii) = rmse1;
% if jj == 2
%     figHangle2 = figure;
% else
%     figure(figHangle2)
% end
% figure('Units', 'pixels', ...
%    'Position', [300 300 640 480]);
figure(plots{2,jj})
subplot(2,1,1);
error1  = plot(timelqg(:,1),avgstateslqg(:,6));
grid on;
set(error1               , ...
  'LineStyle'       , '--'        , ...
  'Color'           , color(mod(ii-1,length(color))+1)        , ...
  'DisplayName'           , num2str(mu(jj))        , ...
  'LineWidth'       , 2          );

hXLabel = xlabel('Time (second)' , 'FontName'   , 'Times New Roman' ,...
  'FontSize'   , 14 , 'FontWeight', 'bold'                    );
hYLabel = ylabel('Vertical Poiting Error (cm)', 'FontName'   , 'Times New Roman' ,...
  'FontSize'   , 14 , 'FontWeight', 'bold'                      );
hTitle = title(['Cumulant k = ' num2str(jj)], 'FontName'   , 'Times New Roman' ,...
  'FontSize'   , 14 , 'FontWeight', 'bold'                      );
set(gcf, 'color', 'white');
set(gca, ...
  'FontName'   , 'Times New Roman' ,...
  'FontSize'   , 14 , 'FontWeight', 'bold');
hold on
rmse2 = norm(avgstateslqg(:,12))/sqrt(length(avgstateslqg(:,12)));
rmse_h(jj,ii) = rmse2;
subplot(2,1,2);
error2  = plot(timelqg(:,1),avgstateslqg(:,12));
grid on;
set(error2               , ...
  'LineStyle'       , '-'        , ...
  'Color'           , color(mod(ii-1,length(color))+1)        , ...
  'DisplayName'           , num2str(mu(jj))        , ...
  'LineWidth'       , 2          );

hXLabel = xlabel('Time (second)' , 'FontName'   , 'Times New Roman' ,...
  'FontSize'   , 14 , 'FontWeight', 'bold'                    );
hYLabel = ylabel('Horizontal Poiting Error (cm)', 'FontName'   , 'Times New Roman' ,...
  'FontSize'   , 14 , 'FontWeight', 'bold'                      );
hTitle = title(['Cumulant k = ' num2str(jj)], 'FontName'   , 'Times New Roman' ,...
  'FontSize'   , 14 , 'FontWeight', 'bold'                      );
set(gca, ...
  'FontName'   , 'Times New Roman' ,...
  'FontSize'   , 14 , 'FontWeight', 'bold');
hold on
%% VELOCITY
% 
% figure('Units', 'pixels', ...
%    'Position', [300 300 640 480]);
% subplot(2,1,1);
% state2  = plot(timelqg(:,1),avgstateslqg(:,2));
% grid on;
% set(state2                , ...
%   'LineStyle'       , '--'        , ...
%   'Color'           , 'r'        , ...
%   'LineWidth'       , 2          );
% 
% hXLabel = xlabel('Time (second)' , 'FontName'   , 'Times New Roman' ,...
%   'FontSize'   , 14 , 'FontWeight', 'bold'                    );
% hYLabel = ylabel('\omega_{ey} (rad per sec)', 'FontName'   , 'Times New Roman' ,...
%   'FontSize'   , 14 , 'FontWeight', 'bold'                      );
% hTitle = title([' Number of cumulants k = ' num2str(k)], 'FontName'   , 'Times New Roman' ,...
%   'FontSize'   , 14 , 'FontWeight', 'bold'                      );
% set(gcf, 'color', 'white');
% set(gca, ...
%   'FontName'   , 'Times New Roman' ,...
%   'FontSize'   , 14 , 'FontWeight', 'bold');
% 
% subplot(2,1,2);
% state6  = plot(timelqg(:,1),avgstateslqg(:,8));
% grid on;
% set(state6                , ...
%   'LineStyle'       , '-'        , ...
%   'Color'           , 'b'        , ...
%   'LineWidth'       , 2          );
% 
% hXLabel = xlabel('Time (second)' , 'FontName'   , 'Times New Roman' ,...
%   'FontSize'   , 14 , 'FontWeight', 'bold'                    );
% hYLabel = ylabel('\omega_{ez} (rad per sec)', 'FontName'   , 'Times New Roman' ,...
%   'FontSize'   , 14 , 'FontWeight', 'bold'                      );
% hTitle = title([' Number of cumulants k = ' num2str(k)], 'FontName'   , 'Times New Roman' ,...
%   'FontSize'   , 14 , 'FontWeight', 'bold'                      );
% 
% set(gca, ...
%   'FontName'   , 'Times New Roman' ,...
%   'FontSize'   , 14 , 'FontWeight', 'bold');
% 
% 
% %% CURRENT
% figure('Units', 'pixels', ...
%    'Position', [300 300 640 480]);
% subplot(2,1,1);
% state3  = plot(timelqg(:,1),avgstateslqg(:,3));
% grid on;
% set(state3                , ...
%   'LineStyle'       , '--'        , ...
%   'Color'           , 'r'        , ...
%   'LineWidth'       , 2          );
% 
% hXLabel = xlabel('Time (second)' , 'FontName'   , 'Times New Roman' ,...
%   'FontSize'   , 14 , 'FontWeight', 'bold'                    );
% hYLabel = ylabel('Pitch Current (A)', 'FontName'   , 'Times New Roman' ,...
%   'FontSize'   , 14 , 'FontWeight', 'bold'                      );
% hTitle = title([' Number of cumulants k = ' num2str(k)], 'FontName'   , 'Times New Roman' ,...
%   'FontSize'   , 14 , 'FontWeight', 'bold'                      );
% set(gcf, 'color', 'white');
% set(gca, ...
%   'FontName'   , 'Times New Roman' ,...
%   'FontSize'   , 14 , 'FontWeight', 'bold');
% 
% subplot(2,1,2);
% state7  = plot(timelqg(:,1),avgstateslqg(:,9));
% grid on;
% set(state7                , ...
%   'LineStyle'       , '-'        , ...
%   'Color'           , 'b'        , ...
%   'LineWidth'       , 2          );
% 
% hXLabel = xlabel('Time (second)' , 'FontName'   , 'Times New Roman' ,...
%   'FontSize'   , 14 , 'FontWeight', 'bold'                    );
% hYLabel = ylabel('Yaw Current (A)', 'FontName'   , 'Times New Roman' ,...
%   'FontSize'   , 14 , 'FontWeight', 'bold'                      );
% hTitle = title([' Number of cumulants k = ' num2str(k)], 'FontName'   , 'Times New Roman' ,...
%   'FontSize'   , 14 , 'FontWeight', 'bold'                      );
% 
% set(gca, ...
%   'FontName'   , 'Times New Roman' ,...
%   'FontSize'   , 12);
% 
% %% CURRENT COMMAND
% 
% figure('Units', 'pixels', ...
%    'Position', [300 300 640 480]);
% subplot(2,1,1);
% state4  = plot(timelqg(:,1),avgstateslqg(:,4));
% grid on;
% set(state4               , ...
%   'LineStyle'       , '--'        , ...
%   'Color'           , 'r'        , ...
%   'LineWidth'       , 2          );
% 
% hXLabel = xlabel('Time (second)' , 'FontName'   , 'Times New Roman' ,...
%   'FontSize'   , 14 , 'FontWeight', 'bold'                    );
% hYLabel = ylabel('Pitch motor current command i_{aEL}^* (A)', 'FontName'   , 'Times New Roman' ,...
%   'FontSize'   , 14 , 'FontWeight', 'bold'                      );
% hTitle = title([' Number of cumulants k = ' num2str(k)], 'FontName'   , 'Times New Roman' ,...
%   'FontSize'   , 14 , 'FontWeight', 'bold'                      );
% set(gcf, 'color', 'white');
% set(gca, ...
%   'FontName'   , 'Times New Roman' ,...
%   'FontSize'   , 14 , 'FontWeight', 'bold');
% 
% subplot(2,1,2);
% state4  = plot(timelqg(:,1),avgstateslqg(:,10));
% grid on;
% set(state4               , ...
%   'LineStyle'       , '-'        , ...
%   'Color'           , 'b'        , ...
%   'LineWidth'       , 2          );
% 
% hXLabel = xlabel('Time (second)' , 'FontName'   , 'Times New Roman' ,...
%   'FontSize'   , 14 , 'FontWeight', 'bold'                    );
% hYLabel = ylabel('Yaw motor current command i_{aAZ}^* (A)', 'FontName'   , 'Times New Roman' ,...
%   'FontSize'   , 14 , 'FontWeight', 'bold'                      );
% hTitle = title([' Number of cumulants k = ' num2str(k)], 'FontName'   , 'Times New Roman' ,...
%   'FontSize'   , 14 , 'FontWeight', 'bold'                      );
% 
% set(gca, ...
%   'FontName'   , 'Times New Roman' ,...
%   'FontSize'   , 14 , 'FontWeight', 'bold');
% %% CONTROL Speed COMMAND
% 
% figure('Units', 'pixels', ...
%    'Position', [300 300 640 480]);
% subplot(2,1,1);
% control1  = plot(timelqg(:,1),avgstateslqg(:,5));
% grid on;
% set(control1               , ...
%   'LineStyle'       , '--'        , ...
%   'Color'           , 'r'        , ...
%   'LineWidth'       , 2          );
% 
% hXLabel = xlabel('Time (second)' , 'FontName'   , 'Times New Roman' ,...
%   'FontSize'   , 14 , 'FontWeight', 'bold'                    );
% hYLabel = ylabel('Pitch Speed Control Command \omega_{EL}^* (V)', 'FontName'   , 'Times New Roman' ,...
%   'FontSize'   , 14 , 'FontWeight', 'bold'                      );
% hTitle = title([' Number of cumulants k = ' num2str(k)], 'FontName'   , 'Times New Roman' ,...
%   'FontSize'   , 14 , 'FontWeight', 'bold'                      );
% set(gcf, 'color', 'white');
% set(gca, ...
%   'FontName'   , 'Times New Roman' ,...
%   'FontSize'   , 14 , 'FontWeight', 'bold');
% 
% subplot(2,1,2);
% control2  = plot(timelqg(:,1),avgstateslqg(:,11));
% grid on;
% set(control2               , ...
%   'LineStyle'       , '-'        , ...
%   'Color'           , 'b'        , ...
%   'LineWidth'       , 2          );
% 
% hXLabel = xlabel('Time (second)' , 'FontName'   , 'Times New Roman' ,...
%   'FontSize'   , 14 , 'FontWeight', 'bold'                    );
% hYLabel = ylabel('Yaw Speed Control Command \omega_{AZ}^* (V)', 'FontName'   , 'Times New Roman' ,...
%   'FontSize'   , 14 , 'FontWeight', 'bold'                      );
% hTitle = title([' Number of cumulants k = ' num2str(k)], 'FontName'   , 'Times New Roman' ,...
%   'FontSize'   , 14 , 'FontWeight', 'bold'                      );
% 
% set(gca, ...
%   'FontName'   , 'Times New Roman' ,...
%   'FontSize'   , 14 , 'FontWeight', 'bold');
