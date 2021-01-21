close all

a = 2;
b = 10;
A = 2;
fc = 500;
fDev = 50;
tmin = -0.1;
tmax = 0.1;
L = 8192;
Fe = L/(tmax-tmin); %Fe = 4096
Te = 1/Fe;
t = linspace(tmin,tmax,L);
f = (-L/2:L/2-1)/(L/Fe);

%% Initialisation des signaux
m = a * cos(2*pi*b*t);
pq = A * cos(2*pi*fc*t);
M = fftshift(abs(fft(m,L)));
P = fftshift(abs(fft(pq,L)));
figure('Name','Init')
subplot(221)
plot(t,m)
subplot(223)
plot(t,pq)

subplot(222)
plot(f,M)
subplot(224)
plot(f,P)

%% Demodulation FM/PM

% a

y = fmmod(m,fc,Fe,fDev);
figure('Name','Modulation FM')
plot(t,y)
hold on
plot(t,m)


%%%%%detecteur d'envelope

figure('Name','demodulation FM frequency')
Ydem = diff(y); %derivateur
Ydem = Ydem .* (Ydem>0); 
TfYdem = fftshift(abs(fft(Ydem,L)));
[B,A] = butter(5,0.01,"low");
Sm1 = filter(B,A,Ydem);
TfSm1 = fftshift(abs(fft(Sm1,L)));
plot(f,TfSm1)
%%%%%

figure('Name','demodulation FM')
plot(t(1:length(Ydem)),Ydem)
hold on
ydem =(Sm1-mean(Sm1));
ydem = (Fe/(2*pi*fDev)) .* ydem; 
plot(t(1:length(Ydem)),ydem)
hold on 
plot(t,m)





%b FM demodulation
UpZCi = @(v) find((v(1:end-1) <= 0 & v(2:end) > 0) | (v(1:end-1) >= 0 & v(2:end) < 0));	% Returns Up Zero-Crossing Indices


figure('Name','FM demodulation')
a=UpZCi(y);
pulses = zeros(1,L);
pulses(a)=1;
stem(t,pulses)
hold on
plot(t,y)

Tfpulses = fftshift(abs(fft(pulses,L)));
[B,A] = butter(5,0.01,"low");
Sm1 = (Fe/(2*pi*fDev)) * filter(B,A,pulses);
hold on
plot(t,Sm1-mean(Sm1),'b')
% hold on
% plot(t, fmdemod(y,500,Fe,50))
hold on
plot(t,m)
%c  PM demodulation

y = pmmod(m,500,Fe,5);

figure('Name','PM demodulation')
a=UpZCi(y);
pulses = zeros(1,L);
pulses(a)=1;
stem(t,pulses)
hold on
plot(t,y)

Tfpulses = fftshift(abs(fft(pulses,L)));
[B,A] = butter(5,0.01,"low");
Sm1 = filter(B,A,pulses);
hold on
plot(t,Sm1-mean(Sm1),'b')