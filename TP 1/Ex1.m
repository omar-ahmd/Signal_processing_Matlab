tmax = 1;
tmin = -1;
%% Partie C
L = 64;
Fe = L/(tmax-tmin); %Fe = 32 HZ
Te = 1/Fe;
t = linspace(tmin,tmax,L);
m = sin(2*3*pi*t);
p = cos(2*25*pi*t);
figure('Name','Partie C')
subplot(421);
plot(m)
title('64 points')
subplot(422)
plot(p)
title('64 points')

L = 256;
Fe = L/(tmax-tmin); %Fe = 128 HZ
Te = 1/Fe;
t = linspace(tmin,tmax,L);
m = sin(2*3*pi*t);
p = cos(2*25*pi*t);

subplot(423);
plot(m)
title('256 points')
subplot(424)
plot(p)
title('256 points')

L = 512;
Fe = L/(tmax-tmin); %Fe = 256 HZ
Te = 1/Fe;
t = linspace(tmin,tmax,L);
m = sin(2*3*pi*t);
p = cos(2*25*pi*t);

subplot(425);
plot(m)
title('points')
subplot(426)
plot(p)
title('points')


L = 1024;
Fe = L/(tmax-tmin); %Fe = 512 HZ
Te = 1/Fe;
t = linspace(tmin,tmax,L);
m = sin(2*3*pi*t);
p = cos(2*25*pi*t);

subplot(427);
plot(m)
title('1024 points')
subplot(428)
plot(p)
title('1024 points')



%% Partie D
L = 1024;
Fe = L/(tmax-tmin); %Fe = 512 plus grand que la fraquence maximale 25 HZ
Te = 1/Fe;
t = linspace(tmin,tmax,L);

 

m = sin(2*3*pi*t);
p = cos(2*25*pi*t);
mp = m+p;
figure('Name','Partie D')
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



