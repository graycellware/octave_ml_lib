function [ mu sigma ] = plotnormfit(v1,v2,p1,p2)

graphics_toolkit('fltk');

[ mu, sigma ] = normfit(v1,v2,p1,p2);

X = (mu-4*sigma:0.1:mu+4*sigma);
Y =normpdf(X,mu,sigma);
figure; hold on;
plot(X,Y,'-g','linewidth',3);
plot([v1,v1],ylim,'--k');
plot([v2,v2],ylim,'--k');
plot([mu,mu],ylim,'--b');
plot([v1,v2],[0,0],'-r','linewidth',4);
p1str = sprintf('%6.2f%%', (p1*100.0));
p2str = sprintf('%6.2f%%', (p2*100.0));
text(v1,(max(ylim)*0.5),p1str);
text(v2,(max(ylim)*0.5),p2str);	
titlestr=sprintf('Normal curve fitted for %6.2f at %5.2f%% and %6.2f at %5.2f%%\n mu = %6.2f sigma = %6.2f', ...
		v1,(p1*100.0),v2,(p2*100.0),mu,sigma);
title(titlestr);
xlabel('x-axis');
ylabel('Probability Density');
hold off;
print('normfit.png');
close all;
end
