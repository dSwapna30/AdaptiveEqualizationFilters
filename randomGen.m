function x = randomGen(n)                   %Generation of random data sequence of values +1 and -1
x = randi([0 1],1,n); 
for n = 1:n
    if x(n)==0
       x(n)= x(n)-1;
    end
end
end