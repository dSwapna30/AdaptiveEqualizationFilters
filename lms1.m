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

x_len=length(x);
syms z;
for i = 1:x_len
    X(i)=[x(i)*z^-(i-3)];
end
XZ = sum(X)
