clc;
clear all;
close all;
%% Inputs
n = 500;                                 %Number of transmitted symbols   
input = randi([0 1],1,n);                %Binary Input signal
noisePower = 0.001;                      %Noise Power
h = [0.2194, 1, 0.2194];                 %Channel Coefficients
tap_wieghts = 11;                        %Number_Tap wieghts
tap_coeffecients = zeros (tap_wieghts,1);               %Tap_wieghts
tap_coeffecients((tap_wieghts+1)/2,1)=1;
%delta = 0.055;                           %Step_size_delta
%delta = 0.11;
delta = 0.0275
delta_vector = zeros(tap_wieghts,1);
output = zeros(1,n);
error = zeros(1,n);


%% Channel Output Generation

u = randomGen(input, n);
x = filterconv(h);
f = fCoeffcients(x);
v = conv(u,f)+noisePower;                  %Channel Output
plot(u)
hold on
% plot(v)
% hold on

%% LMS 

LMSOutput(v,u,delta);

 
%% NMLS

%Delta (k) = delta / (a + ||c (k)||^2)

a = 0.01;
for i = 1 : n
    delta_vector(i)= delta/(a + (abs(v(i))^2));
end
for i = tap_wieghts: n
     range_U = (v(i:-1:i-tap_wieghts+1))';
     output(i)= tap_coeffecients'*range_U;
     error(i) = u(i) - output(i);
     tap_coeffecients = tap_coeffecients + delta_vector(i)*range_U*error(i);
end

plot(output)


