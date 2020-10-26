L = 2048;
tmax = 1;
tmin = -1;
Fe = L/(tmax-tmin); 
Te = 1/Fe;
t = linspace(-1,1,L);
f = (-L/2:L/2-1)/(L/Fe);

m = 2*cos(8*pi*t) + sin(17*pi*t) + 0.5*cos(20*pi*t); % signal modulant
p = 3*cos(2*100*pi*t); % porteuse
s = 2 * m .* p;

x = m + p;
y = x.^2;
figure(1)

subplot(311)
plot(x)

subplot(312)
plot(y)

[B1,A1]=butter(5,[0.08 0.12],'stop');
st=filter(B1,A1,y);
subplot(313)
plot(st)

figure(2)
plot(f, fftshift(abs(fft(st,L))));