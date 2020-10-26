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

sh=3*m.*cos(200*pi*t) - 3.*sin(200*pi*t).*hilbert(m); %USB
S2f=fftshift(abs(fft(sh)));

figure(1)
plot(S2f)


%c1
figure(2)
ol = cos(200*pi*t+0);
sm1 = sh .* ol;
ol = cos(200*pi*t+pi/4);
sm2 = sh .* ol;
ol = cos(200*pi*t+pi/2);
sm3 = sh .* ol;


figure(2)
plot(t,sm1)
hold on
plot(t,sm2)
hold on
plot(t,sm3)