close all

a = 2;
b = 10;
A = 2;
fc = 500;
fDev = 50;
tmin = -0.5;
tmax = 0.5;
L = 8192;
Fe = L/(tmax-tmin); %Fe = 4096
Te = 1/Fe;
t = linspace(tmin,tmax,L);
f = (-L/2:L/2-1)/(L/Fe);

r = cos(2*pi*10*t+pi/4)+0.5*cos(2*pi*12*t+pi/3)+cos(2*pi*14*t)+1*cos(2*pi*16*t+pi/12)+0.3*cos(2*pi*18*t+5*pi/7);
p = A * cos(2*pi*fc*t);

%% Modulation
rFM = fmmod(r,fc,Fe,fDev);
TFrFM = fftshift(abs(fft(rFM,L)));
figure('Name','Modulation')
subplot(311)
plot(t,rFM);
subplot(312)
plot(f,TFrFM)

%% Demodulation
subplot(313)
plot(t,fmdemod(rFM,fc,Fe,fDev))
