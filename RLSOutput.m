function [error output] = RLSOutput(v,u,lambda)
n=500;     
delta = 0.05;
tap_wieghts = 11;
w = zeros (n,tap_wieghts);               %Tap_wieghts
w(tap_wieghts-1,(tap_wieghts+1)/2)=1;
P=eye(tap_wieghts)/delta;
N=7;

d = circshift(u,N);
d(1:N)=0;

for i = tap_wieghts: n
     range_U = (v(i:-1:i-tap_wieghts+1))';
     k = lambda^(-1)*P*range_U/((1+lambda^(-1))*range_U'*P*range_U);
     alpha(i) = d(i) - w(i-1,:)*range_U;
     w(i,:) = w(i-1,:)+(k'*conj(alpha(i)));
     output(i)= w(i,:)*range_U;
     error(i) = d(i) - output(i);
     P = lambda^(-1)*P-(lambda^(-1))*k*range_U'*P;
end

end

