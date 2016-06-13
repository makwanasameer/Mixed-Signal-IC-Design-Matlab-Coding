% Noise
n_len = 2^11;
n_min = -1;
n_max = 1;
x = n_min + (n_max-n_min).*rand(1,n_len);
% Filter b exported from GUI of FDATool
y = filter(b,1,x);
% TF Estimate
N = 2^7;
x = x(1:end-N/2);
y = y((N/2)+1:end);
[Txy, w] = tfestimate(x,y,N,N/2,N);
% Magnitude
mag = abs(Txy);
% Plot Magnitude
figure();
plot(w/pi,mag2db(mag));
title('Magnitude Plot');
ylabel('Mag(dB)');
xlabel('Normalized Frequency (\times\pi rad/sample)');