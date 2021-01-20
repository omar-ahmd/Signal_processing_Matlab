L = 2048;
tmax = 1;
tmin = -1;
Fe = L/(tmax-tmin); 
Te = 1/Fe;
t = linspace(-1,1,L);
f = (-L/2:L/2-1)/(L/Fe);



m = 2*cos(8*pi*t) + sin(17*pi*t) + 0.5*cos(20*pi*t); % signal modulant
p = 3*cos(2*100*pi*t); % porteuse
s = m.*p;
S1f=fftshift(abs(fft(s)));
sh=3*m.*cos(200*pi*t) - 3.*sin(200*pi*t).*hilbert(m); %USB
S2f=fftshift(abs(fft(sh)));

figure('Name','Partie b')
subplot(211)
plot(f,S1f)
subplot(212)
plot(f,S2f)



%% c1

ol = cos(200*pi*t+0);
sm1 = sh .* ol;
ol = cos(200*pi*t+pi/4);
sm2 = sh .* ol;
ol = cos(200*pi*t+pi/2);
sm3 = sh .* ol;


figure('Name','Partie C1')
subplot(311)
plot(t,sm1)
subplot(312)
plot(t,sm2)
subplot(313)
plot(t,sm3)


TF_Sd1 = fftshift(abs(fft(sm1,L)));
TF_Sd2 = fftshift(abs(fft(sm2,L)));
TF_Sd3 = fftshift(abs(fft(sm3,L)));

[B,A] = butter(3,0.02,"low");
SFm1 = filter(B,A,sm1);
SFm2 = filter(B,A,sm2);
SFm3 = filter(B,A,sm3);
figure('Name','Partie C2')
plot(t,SFm1)
hold on
plot(t,SFm2)
hold on
plot(t,SFm3)

figure('Name','Partie C2 FREQUENCY')
subplot(311);
plot(f,TF_Sd1)
subplot(312)
plot(f,TF_Sd2)
subplot(313)
plot(f,TF_Sd3)