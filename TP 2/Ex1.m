a = 10;
b = 10;
A = 2;
fc = 500;
fDev = 50;
tmin = -0.1;
tmax = 0.1;
L = 512;
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

%% Modulation FM
% a
y = fmmod(m,fc,Fe,fDev);
figure('Name','Modulation FM')
plot(t,y)
hold on
plot(t,m)

%b-c
b=10;
m = a * cos(2*pi*b*t);
y1 = fmmod(m,fc,Fe,40);
y2 = fmmod(m,fc,Fe,50);
y3 = fmmod(m,fc,Fe,60);

sf1 = fftshift(abs(fft(y1,L)));
sf2 = fftshift(abs(fft(y2,L)));
sf3 = fftshift(abs(fft(y3,L)));

figure('Name','Modulation FM avec different valeur de delta')
subplot(321)
plot(t,y1)
subplot(323)
plot(t,y2)
subplot(325)
plot(t,y3)

subplot(322)
plot(f,sf1)
subplot(324)
plot(f,sf2)
subplot(326)
plot(f,sf3)

%d
m1 = a * cos(2*pi*10*t);
m2 = a * cos(2*pi*15*t);
m3 = a * cos(2*pi*20*t);

y1 = fmmod(m1,fc,Fe,60);
y2 = fmmod(m2,fc,Fe,60);
y3 = fmmod(m3,fc,Fe,60);


sf1 = fftshift(abs(fft(y1,L)));
sf2 = fftshift(abs(fft(y2,L)));
sf3 = fftshift(abs(fft(y3,L)));

figure('Name','Modulation FM avec differents valeurs de b')
subplot(321)
plot(t,y1)
subplot(323)
plot(t,y2)
subplot(325)
plot(t,y3)

subplot(322)
plot(f,sf1)
subplot(324)
plot(f,sf2)
subplot(326)
plot(f,sf3)

%% Modulation PM
a=10;
b=10;
m = a * cos(2*pi*b*t);
y = pmmod(m,fc,Fe,5);

figure('Name','Modulation PM')
plot(t,y)
hold on
plot(t,m)

%% Multiplieur de frequence
%a
fc=10;

pq = (A * cos(2*pi*fc*t)).^4;
TF_P = fftshift(abs(fft(pq,L)));

pF = bandpass(pq,[39 41],Fe);
TF_PF = fftshift(abs(fft(pF,L)));

figure('Name','Multiplieur de freqence 40HZ')
subplot(221)
plot(t,pq)
subplot(223)
plot(f,TF_P)

subplot(222)
plot(t,pF)
subplot(224)
plot(f,TF_PF)

%b
pFF = pF .^ 3;
TF_P = fftshift(abs(fft(pFF,L)));

pFFF = bandpass(pFF,[115 125],Fe);
TF_PF = fftshift(abs(fft(pFFF,L)));


figure('Name','Multiplieur de freqence 120HZ')
subplot(221)
plot(t,pFF)
subplot(223)
plot(f,TF_P)

subplot(222)
plot(t,pFFF)
subplot(224)
plot(f,TF_PF)





figure('Name','comparaison')
subplot(311)
plot(t,pq)
subplot(312)
plot(f,pF)
subplot(313)
plot(t,pFFF)

