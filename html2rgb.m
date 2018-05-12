function [ cvec, rgbvec ] = html2rgb(htmlstr)

r = hex2dec(substr(htmlstr,1,2));
g = hex2dec(substr(htmlstr,3,2));
b = hex2dec(substr(htmlstr,5,2));

rgbvec = [ r g b ];
cvec = rgbvec./255;
endfunction

