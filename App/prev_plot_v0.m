% This code is created by Do Ngo-Ngoc (ngongocdobk@gmail.com)  
% Department of Structural Engineering, FCE, HCMUT
% Theory for code: Watch at https://bit.ly/3zDbkYK
clc; close all;
%%
% In put
A = 2;
vp1 = 1; vp2 = -0.75;
lamda_1 = 0.8*pi(); lamda_2 = pi();
w1 = vp1*2*pi()/lamda_1; k1 = 2*pi()/lamda_1; phi_01 = 0;
w2 = vp2*2*pi()/lamda_2; k2 = 2*pi()/lamda_2; phi_02 = 0; 
t = 1; 
x_start = -20; x_end = 20; dx_iter = 0.1; x_iter = 0;
%%
% Create vector for x, f1, f2, f3
n = round((x_end-x_start)/dx_iter); 
x = zeros(1,n); f1 = zeros(1,n); f2 = zeros(1,n);f3 = zeros(1,n);
%%
% Set figure
figure('Position',[200 200 800 800]);
x_iter = x_start;
for i=1:n
% Calculation with the wave functions 
    x(i) = x_iter; x_iter = x_iter + dx_iter;
    f1(i) = A*cos(w1*t - k1*x(i) - phi_01); 
    f2(i) = A*cos(w2*t - k2*x(i) - phi_02);
    f3(i) = f1(i) + f2(i);
    enve_f3_positive =  2*A*cos( (w1-w2)/2*t - (k1-k2)/2*x - (phi_01-phi_02)/2 );
    enve_f3_negative = -2*A*cos( (w1-w2)/2*t - (k1-k2)/2*x - (phi_01-phi_02)/2 );
end
% Plot
    subplot(3,1,1)
        axis([0 inf -2 2])
        plot(x(i),f1(i),'k-o','MarkerFaceColor',[1 0 1])
        hold on
        plot(x(1:i),f1(1:i),'r', 'LineWidth', 1);
        xlabel('x','fontweight','bold','fontsize',10); 
        xlim([x_start x_end]);xticks(x_start:10:x_end);
        ylabel('f_{1}','fontweight','bold','fontsize',10); 
        ylim([-3 3]);yticks(-3:1:3);
        title('f_{1}(\phi) = Acos(\omega_{1}t - k_{1}x - \phi_{01}), {\phi}(x)');
    %
    subplot(3,1,2)
        axis([0 inf -2 2])
        plot(x(i),f2(i),'k-o','MarkerFaceColor',[1 0 1])
        hold on
        plot(x(1:i),f2(1:i),'b', 'LineWidth', 1);
        xlabel('x','fontweight','bold','fontsize',10); 
        xlim([x_start x_end]);xticks(x_start:10:x_end);
        ylabel('f_{2}','fontweight','bold','fontsize',10); 
        ylim([-3 3]);yticks(-3:1:3);
        title('f_{2}(\phi) = Acos(\omega_{2}t - k_{2}x - \phi_{02}), {\phi}(x)');
    %
    subplot(3,1,3)
        plot(x(i),f3(i),'k-o','MarkerFaceColor',[1 0 1])
        hold on
        plot(x(1:i),f3(1:i),'k', 'LineWidth', 1);
        plot(x(i),enve_f3_positive(i),'k-o','MarkerFaceColor','g')
        plot(x(1:i),enve_f3_positive(1:i),'r--', 'LineWidth', 0.75);
        plot(x(1:i),enve_f3_negative(1:i),'b--', 'LineWidth', 0.75);
        %
        xlabel('x','fontweight','bold','fontsize',10); 
        xlim([x_start x_end]);xticks(x_start:10:x_end);
        ylabel('f_{3}','fontweight','bold','fontsize',10); 
        ylim([-5 5]);yticks(-5:1:5);
        title('f_{3}(\phi) = f_{2}(\phi) + f_{1}(\phi), {\phi}(x)');
% Print
print('figure_v1','-dpdf');