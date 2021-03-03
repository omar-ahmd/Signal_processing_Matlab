L = 2048;
tmax = 1;
tmin = -1;
Fe = L/(tmax-tmin); 
Te = 1/Fe;
t = linspace(-1,1,L);



%II-a
m = 2*cos(2*4*pi*t) + sin(2*8.5*pi*t) + 0.5*cos(2*10*pi*t); % signal modulant
mMax = max(m);
m = m/mMax;
p = 3*cos(2*100*pi*t); % porteuse
n=0.5; % indice de modulation
s = (1 + n*m).*p; 

plot(m)


%II-b
n1=0.5;
n2=1;
n3=1.5;

s0 = p;
s1 = (1 + n1*m).*p; 
s2 = (1 + n2*m).*p; 
s3 = (1 + n3*m).*p; 
figure(1)
plot(m)
title("m")


figure(2)
subplot(221)
plot(s0)
title("n=0")
subplot(222)
plot(s1)
title("n=0.5")
subplot(223)
plot(s2)
title("n=1")
subplot(224)
plot(s3)
title("n=1.5")




%II-c
figure(3)
subplot(221)
plot(1)
title("n=0")
subplot(222)
plot((1 + n1*m))
title("n=0.5")
subplot(223)
plot((1 + n2*m))
title("n=1")
subplot(224)
plot((1 + n3*m))
title("n=1.5")


%II-d




figure(4)
subplot(221)
plot(m*mMax,s0)
grid on
title("n=0")
subplot(222)
plot(m*mMax,s1)
grid on
title("n=0.5")
subplot(223)
plot(m*mMax,s2) 
grid on
title("n=1")
subplot(224)
plot(m*mMax,s3) 
grid on
title("n=1.5")

%II-e
f = (-L/2:L/2-1)/(L/Fe);

TF_S0 = fftshift(abs(fft(s0,L)));
TF_S1 = fftshift(abs(fft(s1,L)));
TF_S2 = fftshift(abs(fft(s2,L)));
TF_S3 = fftshift(abs(fft(s3,L)));

figure(5)
subplot(221)
plot(f,TF_S0)
title("n=0")
subplot(222)
plot(f,TF_S1)
title("n=0.5")
subplot(223)
plot(f,TF_S2)
title("n=1")
subplot(224)
plot(f,TF_S3)
title("n=1.5")



%II-f

%f1

s1_dem = s1.*(s1>0);
s3_dem = s3.*(s3>0); % represente le diode

[B,A] = butter(3,0.15,"low");
Sm1 = filter(B,A,s1_dem);
Sm3 = filter(B,A,s3_dem); %filtre passe bas pour eliminer la frequence plus grande que 2wc

%f2-f3
figure(6)
subplot(221)
plot(Sm1)
title('n=0.5')
subplot(222)
TF_Sm1 = fftshift(abs(fft(Sm1,L)));
plot(f,TF_Sm1)
title('n=0.5')

subplot(223)
plot(Sm3)
title('n=1.5')
subplot(224)
TF_Sm3 = fftshift(abs(fft(Sm3,L)));
plot(f,TF_Sm3)
title('n=1.5')
%f4
[B,A] = butter(3,0.02,"low");
Sm1 = (filter(B,A,s1_dem) - 1)/n1;
Sm3 = (filter(B,A,s3_dem) - 1)/n3;

%f5
figure(7);
plot(t,m);

hold on;
plot(t,Sm1);


hold on;
plot(t,Sm3);

