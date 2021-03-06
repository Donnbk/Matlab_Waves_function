function func_format_f2(x_start,x_end)
axis([0 inf -2 2])
hold on
%
xlabel('x','fontweight','bold','fontsize',10); 
xlim([x_start x_end]);xticks(x_start:10:x_end);
ylabel('f_{2}','fontweight','bold','fontsize',10); 
ylim([-3 3]);yticks(-3:1:3);
title('f_{2}(\phi) = Acos(\omega_{2}t - k_{2}x - \phi_{02}), {\phi}(x,t)','FontSize', 10);
hold off
end