clc
clear
close all

% Define time and frequency axis variables
fs = 150; % samples/s
N = 2048; % number of points
dt = 1 / fs; % s, time step
t = (-N/2:N/2-1)*dt; % s, time axis
df = 1 / N / dt; % Hz, frequency step
f = (-N/2:N/2-1)*df; % Hz, frequency axis

fc=50;% Cut Off Frequency

% Define function and take FT
mixed_sine=sin(2*pi*1*t)+sin(2*pi*50.1*t)+sin(2*pi*70*t);
mixed_sine_fft = fftshift(fft(mixed_sine));

figure, plot(t,mixed_sine); grid on 
title('sin(1hz)+sin(50.1hz)+sin(70hz)')
xlabel('time domain') 
figure, plot(f,abs(mixed_sine_fft)); grid on 
title('sin(1hz)+sin(50.1hz)+sin(70hz)')
xlabel('frequency domain') 

%Generating Ideal LPF
I_LPF = zeros(1, length(f));
for i = 1:N
    if(f(i)<=fc && f(i)>=-fc)
        I_LPF(i) = 1;
    else
        I_LPF(i) = 0;
    end
end
figure; plot(f, I_LPF);grid on
title('Ideal LPF Fc = 50hzin freq domain')
xlabel('frequency domain')



% take FT
Ideal_LPF_t = dt*fftshift(ifft(ifftshift(I_LPF)));
figure; plot(t, Ideal_LPF_t);grid on
title('Ideal LPF Fc = 50hz in time domain')
xlabel('time domain') 

% Y
filtered_sine=I_LPF.*mixed_sine_fft;
figure; plot(f, abs(filtered_sine));grid on
title('filtered Signalin frequency domain')
xlabel('frequency domain') 

%IFT
filtered_sine_t=ifft(ifftshift(filtered_sine));
figure; plot(t,filtered_sine_t);grid on
title('filtered Signal in time domain')
xlabel('time domain') 


