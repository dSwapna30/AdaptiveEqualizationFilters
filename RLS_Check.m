function RLS_Check(f,noisePower)
n=500;
lambda1 = 0.9;
lambda2 = 0.7; 
lambda3 = 0.5;
number_iterations = 200;
e_rls1 = zeros(number_iterations,n);
e_rls2 = zeros(number_iterations,n);
e_rls3 = zeros(number_iterations,n);
figure
for j = 1:number_iterations
    u = randomGen(n);
    v = conv(u,f)+noisePower;
    [e_rls1(j,:),o_rls1]=RLSOutput(v,u,lambda1);
    plot(abs(e_rls1(j,:)))
    title('RLS Equalizer Error for lambda 0.9(200 interations)');
    hold on;
end
figure
for j = 1:number_iterations
    u = randomGen(n);
    v = conv(u,f)+noisePower;
    [e_rls2(j,:),o_rls2]=RLSOutput(v,u,lambda2);
    plot(abs(e_rls2(j,:)))
    title('RLS Equalizer Error for lambda 0.7(200 interations)');
    hold on;
end
figure
for j = 1:number_iterations
    u = randomGen(n);
    v = conv(u,f)+noisePower;
    [e_rls3(j,:),o_rls3]=RLSOutput(v,u,lambda3);
    plot(abs(e_rls3(j,:)))
    title('RLS Equalizer Error for lambda 0.5(200 interations)');
    hold on;
end
figure
plot(abs(e_rls1(number_iterations,:)))
hold on
plot(abs(e_rls2(number_iterations,:)))
hold on
plot(abs(e_rls3(number_iterations,:)))
hold on
title('Comparison for all lambda values')
legend('lambda = 0.5','lambda = 0.7','lambda = 0.9')
end