L = 1024;
tmax = 1;
tmin = -1;
Fe = L/(tmax-tmin); %Fe = 512 plus grand que la fraquence maximale 25 HZ
Te = 1/Fe;
t = linspace(tmin,tmax,L);

 

m = sin(2*3*pi*t);
p = cos(2*25*pi*t);
mp = m+p;
figure
subplot(321);
plot(m)
subplot(323)
plot(p)
subplot(325)
plot(mp)


f = linspace(-Fe/2,Fe/2,L);
M = fftshift(abs(fft(m)));
subplot(322);
plot(f,M);

P = fftshift(abs(fft(p)));
subplot(324)
plot(f,abs(P))

MP = abs(M+P);
subplot(326)
plot(f,MP)



