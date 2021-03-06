function [x,y] = LMSOutput(v,u,delta) 
n=500;                                   %Number of input smaples
output = zeros(1,n);                     
error = zeros(1,n);
tap_wieghts = 11;                        %Number_Tap wieghts
w = zeros (n,tap_wieghts);               %Tap_wieghts
w(tap_wieghts,(tap_wieghts+1)/2)=1;      %Initializing Tap wieghts
N = 7;

d = circshift(u,N);                      %Derised Response
d(1:N)=0;


for i = tap_wieghts: n                   
     range_U = (v(i:-1:i-tap_wieghts+1))';
     output(i)= w(i,:)*range_U;                       %Filter Output
     error(i) = d(i) - output(i);                     %Estimation Error
     w(i+1,:) = w(i,:) + delta*range_U'*error(i);     %Tap-weight Adaptation
 end
x = error;
y = output;

 