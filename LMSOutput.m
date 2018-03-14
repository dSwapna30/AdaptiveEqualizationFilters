function LMSOutput(v,u,delta) 
n=500;
output = zeros(1,n);
error = zeros(1,n);
tap_wieghts = 11;                        %Number_Tap wieghts
w = zeros (tap_wieghts,1);               %Tap_wieghts
w((tap_wieghts+1)/2,1)=1;


for i = tap_wieghts: n
     range_U = (v(i:-1:i-tap_wieghts+1))';
     output(i)= w'*range_U;
     error(i) = u(i) - output(i);
     w = w + delta*range_U*error(i);
 end

 for i = tap_wieghts: n
     range_U = (v(i:-1:i-tap_wieghts+1))';
     output(i)= w'*range_U;
     error(i) = u(i) - output(i);
 end
 
 plot(output)
 