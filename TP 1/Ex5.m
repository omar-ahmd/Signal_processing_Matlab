L = 2048;
tmax = 1;
tmin = -1;
Fe = L/(tmax-tmin); 
Te = 1/Fe;
t = linspace(-1,1,L);
f = (-L/2:L/2-1)/(L/Fe);

m = 2*cos(8*pi*t) + sin(17*pi*t) + 0.5*cos(20*pi*t); % signal modulant
p = 3*cos(2*100*pi*t); 

x = m + p;
y1 = x.*(x>0); %NL Diode
y2 = x.^2; %NL ()^2


figure('Name', 'Partie b')
subplot(311)
plot(t,x)
title('X(t)')

subplot(312)
plot(t,y1)
title('NL diode Y(t)')

subplot(313)
plot(t,y2)
title('NL ()^2 Y(t)')

%% Partie C
figure('Name', 'Partie c Frequency')
Fy1 = fftshift(abs(fft(y1,L)));
Fy2 = fftshift(abs(fft(y2,L)));

subplot(211)
plot(f,Fy1)
title('Diode')
subplot(212)
plot(f,Fy2)
title('()^2')

figure('Name','Filtrage a Wc')
[B1,A1]=butter(5,[0.08 0.12],'stop');
sy1=filter(B1,A1,y1);
sy2=filter(B1,A1,y2);
subplot(221)
plot(sy1)
subplot(222)
plot(f, fftshift(abs(fft(sy1,L))));


subplot(223)
plot(sy2)
subplot(224)
plot(f, fftshift(abs(fft(sy2,L))));


