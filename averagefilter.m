f=10;
fs=(10*1024);
%n=0:1/10240:1/10;
n=1:1024;
x=sin(2*pi*(f/fs)*n);

% Noise
n_len = length(n);
n_min = -0.5;
n_max = 0.5;
noise = n_min + (n_max-n_min).*rand(1,n_len);
x_n = x + noise;
% Output
% Filter the original signal
y=ma_filt(51,x_n);
% % Plot
figure();
hold on;
plot(n,x,'r');
plot(n,x_n,'g');
plot(n,y,'b');

legend('Original Signal','Noisy Signal','Moving Average Signal');
xlabel('Sample');
ylabel('Amplitude');