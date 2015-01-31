clear all
%% BS density fixed 
%  x = [5 9 7 10 12 9 0];
%  lambda = [0.2 0.2 0.2 0.2 0.2 0.2];
%  lambda_user = [0.2 0.3 0.2 0.5 0.4 0.7];
%  x = fsolve(@(p)bbsm_loss(p,lambda,lambda_user,5,10),x);
% 
% figure(1);
% 
% bar(lambda_user)
% handle=figure(1);
% 
% set(handle, 'Position', [400 100 1000 500]);
% legend('User Density');
% saveas(handle,'1_1.bmp','bmp');
% 
% figure(2);
% bar(x(1:end-1));
% handle=figure(2);
% set(handle, 'Position', [400 100 1000 500]);
% legend('Power Allocation');
% saveas(handle,'1_2.bmp','bmp');

%% User density fixed
%   x = [5 9 7 10 12 9 0];
%  lambda = [0.2 0.3 0.2 0.5 0.15 0.7];
%  lambda_user = [0.2 0.2 0.2 0.2 0.2 0.2];
%  x = fsolve(@(p)bbsm_loss(p,lambda,lambda_user,5,10),x);
% 
% figure(3);
% bar(lambda)
% handle=figure(3);
% set(handle, 'Position', [400 100 1000 500]);
% legend('BS Density');
% saveas(handle,'2_1.bmp','bmp');
% 
% figure(4);
% bar(x(1:end-1));
% handle=figure(4);
% set(handle, 'Position', [400 100 1000 500]);
% legend('Power Allocation');
% saveas(handle,'2_2.bmp','bmp');
% 
% close all
% a = imread('1_1.bmp');
% b = imread('1_2.bmp');
% c = imread('2_1.bmp');
% d = imread('2_2.bmp');
% 
% e = [a c;b d];
% imwrite(e,'1.png');
% system('bmeps -t png 1.png  C:\Users\RalphMao\Home\Homework\大三上\随机过程\bigtwo\figures\1.eps');

%% User & BS density fixed, power constraints change
% clear all
% a=1:0.5:20;
% b=a;
% c=a;
% for i=2:40
%  x = [5 2 0];
%  lambda = [0.2 0.2];
%  lambda_user = [0.2 0.3];
%  x = fsolve(@(p)bbsm_loss(p,lambda,lambda_user,5,i/2),x);
%  b(i-1) = bbsm(x(1),0.2,5);
%  c(i-1) = bbsm(x(2),0.2,5);
% end
% figure(5);
% hold on
% plot(a,b);
% plot(a,c,'r');
% handle = figure(5);
% set(handle, 'Position', [400 100 1000 800]);
% legend('User Density 2.0','User Density 3.0');
% saveas(handle,'3.png','png');
% system('bmeps -c -t png 3.png  C:\Users\RalphMao\Home\Homework\大三上\随机过程\bigtwo\figures\2.eps');
% hold off

%% When power constraints are extremely low
 % Different initial values would produce different results
 x = [1 7 0];
 lambda = [0.2 0.2];
 lambda_user = [0.2 0.4];
 x = fsolve(@(p)bbsm_loss(p,lambda,lambda_user,5,0.5),x);
 [lambda_user;x(1:2)]

 x = [7 1 0];
 lambda = [0.2 0.2];
 lambda_user = [0.2 0.4];
 x = fsolve(@(p)bbsm_loss(p,lambda,lambda_user,5,0.5),x);
 [lambda_user;x(1:2)]

%% Other Figures
% 
% x = [0.01:0.05:10];
% y = x;
% z = x;
% zz  = x;
% for i=1:length(x)
%     y(i) = bbsm(x(i),0.2,5);
%     z(i) = bbsm_deri(x(i),0.2,5);
% end
% zz(2:end) = diff(z)*100;
% 
% figure(6);
% hold on
% handle = figure(6);
% plot(x,y);
% [m,c] = max(y./x);
% line([0,3*x(c)],[0,3*y(c)]);
% line([x(c),x(c)],[0,y(c)]);
% hold off
% set(handle, 'Position', [400 100 1000 500]);
% saveas(handle,'4.png','png');
% system('bmeps -c -t png 4.png  C:\Users\RalphMao\Home\Homework\大三上\随机过程\bigtwo\figures\3.eps');
