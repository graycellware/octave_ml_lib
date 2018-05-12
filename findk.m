#!/usr/bin/octave -q

graphics_toolkit('gnuplot');
clear;

G = round(rand(1,1)*100000.0);
rand('seed', G);

load d2.mat; # data is in X
[m,n] = size(X);
minX = min(X);
maxX = max(X);
varX = var(X);
data = X;
sigma = diag(varX./m);
u = linspace(minX(1),maxX(1));
v = linspace(minX(2),maxX(2));
[ X, Y ] = meshgrid(u,v);
XY = [ X(:), Y(:) ];
Z = zeros(size(XY,1),1);
for ii = 1:m
	Z+= mvnpdf(XY,data(ii,:),sigma);
endfor
zmax = max(max(Z));
Z = Z./zmax;
Q = Z > 0.75;
Z = Z.*Q;
mesh (X, Y, reshape (Z, size (X)));
colormap jet;
pause;



exit;
