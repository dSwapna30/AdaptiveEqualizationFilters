function LMS_Check(f,noisePower)
n=500;
delta0 = 0.0138;
delta1 = 0.0275;                         %Step_size_delta
delta2 = 0.055;
number_iterations = 200;
e_lms1 = zeros(number_iterations,n);
e_lms2 = zeros(number_iterations,n); 
e_lms3 = zeros(number_iterations,n); 

figure
for j = 1:number_iterations
    u = randomGen(n);
    v = conv(u,f)+noisePower;
    [e_lms1(j,:),o_lms1]=LMSOutput(v,u,delta0);
    plot(abs(e_lms1(j,:)))
    title('LMS Equalizer Error for step size 0.0138(200 interations)');
    hold on;
end

figure

for j = 1:number_iterations
    u = randomGen(n);
    v = conv(u,f)+noisePower;
    [e_lms2(j,:),o_lms1]=LMSOutput(v,u,delta1);
    plot(abs(e_lms2(j,:)))
    title('LMS Equalizer Error for step size 0.0275(200 interations)');
    hold on;
end

figure
for j = 1:number_iterations
    u = randomGen(n);
    v = conv(u,f)+noisePower;
    [e_lms3(j,:),o_lms1]=LMSOutput(v,u,delta2);
    plot(abs(e_lms3(j,:)))
    title('LMS Equalizer Error for step size 0.055(200 interations)');
    hold on;
end

figure
plot(abs(e_lms1(number_iterations,:)))
hold on
plot(abs(e_lms2(number_iterations,:)))
hold on
plot(abs(e_lms3(number_iterations,:)))
hold on
title('Comparison for all delta values')
legend('delta = 0.0138','delta = 0.0275','delta = 0.055')

end
