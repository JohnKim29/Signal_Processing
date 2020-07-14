clc
clear
close all
N= 1000;

t= linspace(0,10,N);

freq = 1;
w = 2*pi*freq;

ts = 10;% sampling time
ts = (ts*10)/N

impulse_train = zeros(1, N); 
impulse_train(1:ts:end) = 1

analog_signal = sin(w*t);
plot(t,analog_signal);
grid on
digital_signal = impulse_train .* analog_signal; 
stem(t,digital_signal);







