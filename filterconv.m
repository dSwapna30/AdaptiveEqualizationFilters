function y = filterconv(x)
xConj = conj(fliplr(x));                 %h*(-n)
y = conv(x,xConj);                       %COnvolution of h(n) with h*(-n)
end