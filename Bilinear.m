% Filter Params
R = 500.487e3;
C = 1e-12;
% s-domain TF
G = 1/(R*C);
num = 1;
den = [1/G, 1];
% Bilinear Transform
fs = 200e6;
[b, a] = bilinear(num,den,fs);
% Impulse Response
%figure();
%impz(b,a,50,fs);

% Freq Response
[h, f] = freqz(b,a,2^13,fs);
% Plot Mag Response
figure();
semilogx(f,mag2db(abs(h))-6);
xlabel('Freq (Hz)');
ylabel('Mag');