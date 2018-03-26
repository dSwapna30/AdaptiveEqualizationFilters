clc;
clear all;
close all;
%% Inputs
n = 500;                                 %Number of transmitted symbols   
noisePower = 0.001;                      %Noise Power
h = [0.2194, 1, 0.2194];                 %Channel Coefficients
tap_wieghts = 11;                        %Number_Tap wieghts
w = zeros (n,tap_wieghts);               %Tap_wieghts
w(tap_wieghts,(tap_wieghts+1)/2)=1;      %Initialize                    
delta = 0.055;                           %Step_size_delta
lambda = 0.9;
N = 7;

%% Channel Output Generation
u = randomGen(n);                        %Random Input Generation 
x = filterconv(h);                       %Autocorrelation of channel coefficients 
f = fCoeffcients(x);                     %Determining Coefficients of F(Z)
v = conv(u,f)+noisePower;                %Channel Output
[e_lms,o_lms]=LMSOutput(v,u,delta);      %LMS Algorithm
[e_nlms,o_nlms]=NLMSOutput(v,u,delta);   %NLMS Algorithm
[e_rls,o_rls] = RLSOutput(v,u,lambda);   %RLS Algorithm


%% Ploting
figure
subplot(2,1,1);
plot(u)
title('Input Signal');
subplot(2,1,2);
plot(v)
title('Output of the channel');
 
range_plot = 475:500;
figure
subplot(3,1,1);
plot(range_plot,v(range_plot))
title('Input to Equalizer');
subplot(3,1,2);
plot(range_plot,o_lms(range_plot))
title('LMS Equalizer Output');
subplot(3,1,3);
plot(range_plot, e_lms(range_plot))
title('LMS Equalizer Error');

figure
subplot(3,1,1);
plot(range_plot,v(range_plot))
title('Input to Equalizer')
subplot(3,1,2);
plot(range_plot,o_nlms(range_plot))
title('NLMS Equalizer Output')
subplot(3,1,3);
plot(range_plot,e_nlms(range_plot))
title('NLMS Equalizer Error');

figure
subplot(3,1,1);
plot(range_plot,v(range_plot))
title('Input to Equalizer');
subplot(3,1,2);
plot(range_plot,o_rls(range_plot))
title('RLS Equalizer Output');
subplot(3,1,3);
plot(range_plot,e_rls(range_plot))
title('RLS Equalizer Error');

%% Comparison between LMS, NLMS and RLS
figure
plot(abs(e_lms))
hold on
plot(abs(e_nlms))
hold on
plot(abs(e_rls))
title('Comparison between LMS, NLMS and RLS')
legend('y = elms','y = enlms','y = erls')

%% Running 200 iterations

LMS_Check(f,noisePower);                  
NLMSCheck(f,noisePower);
RLS_Check(f,noisePower);





