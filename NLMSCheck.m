function NLMS_Check(f,noisePower)
n=500;
delta1 = 0.0275;                         %Step_size_delta
delta2 = 0.055;
delta3 = 0.11;
number_iterations = 200;
e_nlms1 = zeros(number_iterations,n);
e_nlms2 = zeros(number_iterations,n); 
e_nlms3 = zeros(number_iterations,n); 

figure
for j = 1:number_iterations
    u = randomGen(n);
    v = conv(u,f)+noisePower;
    [e_nlms1(j,:),o_nlms1]=NLMSOutput(v,u,delta1);
    plot(abs(e_nlms1(j,:)))
    title('NLMS Equalizer Error for step size 0.0257(200 interations)');
    hold on;
end
figure
for j = 1:number_iterations
    u = randomGen(n);
    v = conv(u,f)+noisePower;
    [e_nlms2(j,:),o_nlms2]=NLMSOutput(v,u,delta2);
    plot(abs(e_nlms2(j,:)))
    title('NLMS Equalizer Error for step size 0.055(200 interations)');
    hold on;
end
figure
for j = 1:number_iterations
    u = randomGen(n);
    v = conv(u,f)+noisePower;
    [e_nlms3(j,:),o_nlms3]=NLMSOutput(v,u,delta3);
    plot(abs(e_nlms3(j,:)))
    title('NLMS Equalizer Error for step size 0.11(200 interations)');
    hold on;
end


figure
plot(abs(e_nlms1(number_iterations,:)))
hold on
plot(abs(e_nlms2(number_iterations,:)))
hold on
plot(abs(e_nlms3(number_iterations,:)))
hold on
title('Comparison for all delta values')
legend('delta = 0.0275','delta = 0.055','delta = 0.11')