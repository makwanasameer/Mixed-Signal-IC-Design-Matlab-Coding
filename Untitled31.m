K=4;
x = [0.7419, 0.4457, 0.3362, -0.6423, 0.1010, 0.9198, 0.1920, 0.6171, 0.9691, 0.7718, -0.5723,-0.9307, -0.0978, -0.9724, -0.05258, 0.90239];

y=zero_pad(x,K);

%Plotting signal without padding
subplot(2,1,1);
f=linspace(0,1,length(x));
stem(f,x);
title('Signal without padding');
ylabel('x[nTs]');
xlabel('n,t/Ts');

%Plotting signal with padding
subplot(2,1,2);
f=linspace(0,1,length(y));
stem(f,y);
title('Signal with padding');
ylabel('y[i.Ts/K]');
xlabel('i,Kt/Ts');

figure();
% FFT for simple signal
N=length(x);
f=linspace(0,0.5,N/2);
nfft = 2.^nextpow2(N); % Next power of 2
X = fft(x,nfft);
mag_fft = abs(X(1:N/2));
subplot(2,1,1);
plot(f,mag_fft);
title('FFT of the signal without padding');
ylabel('Magnitude');
xlabel('Frequency (Hz)');

%FFT for padding signal
fs=1e3;
N=length(y);
f=linspace(0,0.5,N/2);
nfft = 2.^nextpow2(N); % Next power of 2
X = fft(y,nfft);
mag_fft = abs(X(1:N/2));
subplot(2,1,2);
plot(f,mag_fft);
title('FFT of the signal with padding');
ylabel('Magnitude');
xlabel('Frequency (Hz)');