L = 2048;
tmax = 1;
tmin = -1;
Fe = L/(tmax-tmin); 
Te = 1/Fe;
t = linspace(-1,1,L);
f = (-L/2:L/2-1)/(L/Fe);

%II-a

m = 2*cos(8*pi*t) + sin(17*pi*t) + 0.5*cos(20*pi*t); % signal modulant
p = 3*cos(200*pi*t); %porteuse
s = m.*p; 
figure('Name','signal Modulant')
plot(m)



%II-b
figure('Name','Partie B')
subplot(211)
plot(s)

TF_S = fftshift(abs(fft(s,L)));
subplot(212);
plot(TF_S);




%II-C1

ol = cos(200*pi*t+0);
sm1 = m .* ol;
ol = cos(200*pi*t+pi/4);
sm2 = m .* ol;
ol = cos(200*pi*t+pi/2);
sm3 = m .* ol;


figure('Name','Partie C1')
plot(t,sm1)
hold on
plot(t,sm2)
hold on
plot(t,sm3)

%% demodulation
sdm1 = sm1 .* p;
sdm2 = sm2 .* p;
sdm3 = sm3 .* p;

TF_Sd1 = fftshift(abs(fft(sdm1,L)));
TF_Sd2 = fftshift(abs(fft(sdm2,L)));
TF_Sd3 = fftshift(abs(fft(sdm3,L)));

[B,A] = butter(3,0.02,"low");
SFm1 = filter(B,A,sdm1);
SFm2 = filter(B,A,sdm2);
SFm3 = filter(B,A,sdm3);
figure('Name','Partie C2')
subplot(311);
plot(SFm1)
subplot(312)
plot(SFm2)
subplot(313)
plot(SFm3)

figure('Name','Partie C2 FREQUENCY')
subplot(311);
plot(TF_Sd1)
subplot(312)
plot(TF_Sd2)
subplot(313)
plot(TF_Sd3)