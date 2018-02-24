clc;
clear all;
close all;
n = 500;                                %Number of transmitted symbols   
u = randi([0 1],1,n);                   %Generation of random data sequence of values +1 and -1
for n = 1:n
    if u(1,n)==0
        u(1,n)= u(1,n)-1;
    end
end

h = [0.2194, 1.000, 0.2194];             %Channel Coefficients
hConj = conj(fliplr(h));                 %h*(-n)
x = conv(h,hConj);                       %COnvolution of h(n) with h*(-n)

x_len=length(x);                         %Calculating Z transform for x(n)
syms z;
for i = 1:x_len
    X(i)=x(i)*z^(i-1);
end
XZ = sum(X);

xRoots = roots(x);                      %Calculating roots of X
n2 = 1;
for n1 = 1:length(xRoots)
    if abs(xRoots(n1)) < 1
        f(n2,1) = xRoots(n1);
        n2 = n2+1;
    end
end

