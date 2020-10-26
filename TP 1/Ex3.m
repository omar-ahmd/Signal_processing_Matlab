L = 2048;
tmax = 1;
tmin = -1;
Fe = L/(tmax-tmin); 
Te = 1/Fe;
t = linspace(-1,1,L);
f = (-L/2:L/2-1)/(L/Fe);

%II-a

m = 2*cos(8*pi*t) + sin(17*pi*t) + 0.5*cos(20*pi*t); % signal modulant
p = 3*cos(200*pi*t); % porteuse
s = m.*p; 




%II-b
figure(1)
subplot(211)
plot(s)

TF_S = fftshift(abs(fft(s,L)));
subplot(212);
plot(TF_S);




%II-C1
figure(2)
ol = cos(200*pi*t+0);
sm1 = m .* ol;
ol = cos(200*pi*t+pi/4);
sm2 = m .* ol;
ol = cos(200*pi*t+pi/2);
sm3 = m .* ol;


figure(2)
plot(t,sm1)
hold on
plot(t,sm2)
hold on
plot(t,sm3)



