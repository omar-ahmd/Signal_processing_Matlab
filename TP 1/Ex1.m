L = 1024;
t = linspace(-1,1,L);

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


f = linspace(-1,1,L);
M = fft(m);
subplot(322);
plot(f,abs(M));

P = fft(p);
subplot(324)
plot(f,abs(P))

MP = abs(M+P);
subplot(326)
plot(f,MP)



