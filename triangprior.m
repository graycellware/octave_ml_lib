function Y = triangprior(x, res)

#	Y = triangprior(x, res)
#	returns the triangular prior centered at the scalar x
#	0 < x < 1
#	res is the resolution 0 < res < 1
#	Typically res = 0.1
if(x<=0) || (x >= 1)
	error('Scalar x 0 < x < 1');
endif
if(res <= 0) || (res >= 1)
	error('Resolution res 0 < res < 1');
endif
T = (0:res:1);
v = 1.0/(1.0-x);
Q1 = T <= x;
Q2=1.0 .- Q1;
Y1 = T./x;
Y2 = (1.0 - T).*v;
Y = Y1.*Q1 + Y2.*Q2;
Y ./= sum(Y);
endfunction
