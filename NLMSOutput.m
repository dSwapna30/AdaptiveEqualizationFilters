%% NMLS
function [x,y]=NLMSOutput(v,u,delta)
%Delta (k) = delta / (a + ||c (k)||^2)
n=500;
output = zeros(1,n);
error = zeros(1,n);
tap_wieghts = 11;                        %Number_Tap wieghts
w = zeros (n,tap_wieghts);               %Tap_wieghts
w(tap_wieghts,(tap_wieghts+1)/2)=1;
N = 7;

d = circshift(u,N);
d(1:N)=0;

a = 0.05;
for i = tap_wieghts: n
     range_U = (v(i:-1:i-tap_wieghts+1));
     output(i)= w(i,:)*range_U';                                            %Filter Output
     error(i) = d(i) - output(i);                                           %Estimation Error
     w(i+1,:) = w(i,:) + (delta/(a + (norm(w(i,:))^2)))*range_U*error(i);   %Normalizing Tap Weights 
end

x = error;
y = output;

