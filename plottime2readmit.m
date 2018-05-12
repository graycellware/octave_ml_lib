function plottime2readmit(lambda,duration, day)

graphics_toolkit('gnuplot');
clf;
if ~isscalar(lambda) || ~isscalar(duration)
	error('Plot requires scalar parameters');
endif

duration = round(duration);

X = (0:duration);
Y = 1 - exp(-lambda*X);
Z = lambda*exp(-lambda*X);


totaLProb = (1 - exp(-lambda*duration))*100;


hold on; grid on;
plot(X,Y*100,'-','linewidth',2,'color',[0.5,0,0.5]);
plot(xlim,[totaLProb, totaLProb],'--k');
tstr = sprintf('Probability of readmission within %d days = %6.2f %%', duration, totaLProb);
text((duration/2), totaLProb + 2,tstr);
ylim([0,100]);
xlim([0,duration]);
if exist('day', 'var')
		
		day = round(day);
    	T = (0:day);
    	T(length(T)+1) = day; #Close the vertices
    	
    	D = 1 - exp(-lambda*T);
    	D(length(T)) = 0;
    	c = [ 0.5, 0.5, 0.5 ];
    	patch(T, D*100, c);
    	Dmax = (1 -exp(-lambda*day))*100.0;
    	plot([day,day],[0,Dmax],'-k' );
    	plot([0,day],[Dmax,Dmax],'--k', 'linewidth', 2);
    	tstr = sprintf('%6.2f %%',Dmax);
    	text(2,Dmax+1,tstr);
    	tstr = sprintf('%d',day);
    	text(day,-1,tstr);
end
xlabel('Day');
ylabel('Probability (%)');
tstr = sprintf('Cumulative Readmission Probability\nProbability=%6.2f %%',totaLProb );
title(tstr);
hold off;
endfunction
