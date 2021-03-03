a = 2;
b = 10;
A = 2;
fc = 500;
fDev = 50;
tmin = -0.2;
tmax = 0.2;
L = 4096;
Fe = L/(tmax-tmin); %Fe = 10240
Te = 1/Fe;
t = linspace(tmin,tmax,L);
f = (-L/2:L/2-1)/(L/Fe);

% Initialisation des signaux
syms t
m = a * cos(2*pi*b*t);
Im =  int(m);
t = linspace(tmin,tmax,L);
m=double(subs(m));
Im = double(subs(Im));

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

mFM = A*cos(2*pi*(fc*t + (fDev)*Im));
figure('Name','Modulation FM')
subplot(211)
plot(t,mFM)
subplot(212)
plot(t,m)
% 
% %b-c
% b=10;
% m = a * cos(2*pi*b*t);
% y1 = A*cos(2*pi*fc*t + (40*2*pi/max(m))*Im);
% y2 = A*cos(2*pi*fc*t + (50*2*pi/max(m))*Im);
% y3 = A*cos(2*pi*fc*t + (60*2*pi/max(m))*Im);
% 
% sf1 = fftshift(abs(fft(y1,L)));
% sf2 = fftshift(abs(fft(y2,L)));
% sf3 = fftshift(abs(fft(y3,L)));
% 
% figure('Name','Modulation FM avec different valeur de delta')
% subplot(321)
% plot(t,y1)
% subplot(323)
% plot(t,y2)
% subplot(325)
% plot(t,y3)
% 
% subplot(322)
% plot(f,sf1)
% subplot(324)
% plot(f,sf2)
% subplot(326)
% plot(f,sf3)
% 
% %d
% 
% syms t
% 
% m1 = a * cos(2*pi*10*t);
% m2 = a * cos(2*pi*15*t);
% m3 = a * cos(2*pi*20*t);
% t = linspace(tmin,tmax,L);
% Im1 =  int(m1);
% 
% Im1 = double(subs(Im1));
% Im2 =  int(m2);
% Im2 = double(subs(Im2));
% Im3 =  int(m3);
% Im3 = double(subs(Im3));
% 
% y1 = A*cos(2*pi*fc*t + (60*2*pi/a)*Im1);
% y2 = A*cos(2*pi*fc*t + (60*2*pi/a)*Im2);
% y3 = A*cos(2*pi*fc*t + (60*2*pi/a)*Im3);
% 
% 
% 
% 
% sf1 = fftshift(abs(fft(y1,L)));
% sf2 = fftshift(abs(fft(y2,L)));
% sf3 = fftshift(abs(fft(y3,L)));
% 
% figure('Name','Modulation FM avec differents valeurs de b')
% subplot(321)
% plot(t,y1)
% subplot(323)
% plot(t,y2)
% subplot(325)
% plot(t,y3)
% 
% subplot(322)
% plot(f,sf1)
% subplot(324)
% plot(f,sf2)
% subplot(326)
% plot(f,sf3)
% 
% %% Modulation PM
% syms t
% m = a * cos(2*pi*b*t);
% t = linspace(tmin,tmax,L);
% m = double(subs(m));
% dm = diff(m);
% dm = double(subs(dm));
% 
% y = A*cos(2*fc*pi*t + (5)*m);
% 
% 
% figure('Name','Modulation PM')
% plot(t,y)
% hold on
% plot(t,m)
% 
% %% Multiplieur de frequence
% %a
% fc=10;
% 
% pq = (A * cos(2*pi*fc*t)).^4;
% TF_P = fftshift(abs(fft(pq,L)));
% 
% 
% 
% pF = bandpass(pq,[39 41],Fe)
% TF_PF = fftshift(abs(fft(pF,L)));
% 
% figure('Name','Multiplieur de freqence 40HZ')
% subplot(221)
% plot(t,pq)
% subplot(223)
% plot(f,TF_P)
% 
% subplot(222)
% plot(t,pF)
% subplot(224)
% plot(f,TF_PF)
% 
% %b
% pFF = pF .^ 3;
% TF_P = fftshift(abs(fft(pFF,L)));
% 
% pFFF = bandpass(pFF,[115 125],Fe);
% TF_PF = fftshift(abs(fft(pFFF,L)));
% 
% 
% figure('Name','Multiplieur de freqence 120HZ')
% subplot(221)
% plot(t,pFF)
% subplot(223)
% plot(f,TF_P)
% 
% subplot(222)
% plot(t,pFFF)
% subplot(224)
% plot(f,TF_PF)
% 
% 
% 
% 
% 
% figure('Name','comparaison')
% subplot(311)
% plot(t,pq)
% subplot(312)
% plot(f,pF)
% subplot(313)
% plot(t,pFFF)
% 
