clc
clear
close all
N= 1000;

t= linspace(0,10,N);

freq = 2;
w = 2*pi*freq;

fs = 4*pi*freq;% sampling frequency
ts = N*(1/10*(1/fs))% sampling time

impulse_train = zeros(1, N); 
impulse_train(1:ts:end) = 1 % gen impulse train for sampling

stem(t,impulse_train);
hold on

analog_signal = sin(w*t);

plot(t,analog_signal);
grid on

digital_signal = impulse_train .* analog_signal; %sampling

figure; stem(t, digital_signal);
grid on






