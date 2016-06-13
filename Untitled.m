clear all;
close all;
load('hw_3_2_signal.mat')
plot(x);
N = 2^11; % Signal length
% FFT
nfft = 2.^nextpow2(N); % Next power of 2
X = fft(x,nfft);
f = linspace(0,fs/2,N/2);
mag_fft = abs(X(1:N/2));
% Plot Magnitude
figure();
plot(f,mag_fft);
title('FFT');
ylabel('Magnitude');
xlabel('Frequency (Hz)');
