function y = fCoeffcients(x)
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
        stableRoots(n2) = xRoots(n1);
        n2 = n2+1;
    end
end
y = poly(stableRoots);                      %Finding fn coeffecients
end