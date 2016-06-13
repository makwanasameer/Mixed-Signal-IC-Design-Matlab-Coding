function echofilt(d,h)
%d=1000;
%h=100;
fs=44100;
T=1/fs;
c=340.29;
r=sqrt((h^2)+((d/2)^2));

M=round(((2*r)-d)/(c*T));
g=(d/(2*r));
%Calculate the transfer function
syms z;
H=((z^-M)+g)/(z^-M);
[numexpr, denexpr] = numden(sym(H));

%// Extract numerator coefficients
[numcoef, numpow] = coeffs(expand(numexpr), z);
num = rot90(sym(sym2poly(sum(numpow))), 2);
num(num ~= 0) = coeffs(expand(numexpr), z);

%// Extract denominator coefficients
[dencoef, denpow] = coeffs(expand(denexpr), z);
den = rot90(sym(sym2poly(sum(denpow))), 2);
den(den ~= 0) = coeffs(expand(denexpr), z);

b=double(num);
a=double(den);

[data, fs] = audioread('audio_sample.mp3');
pause_time = round(length(data)/fs) + 1;
y = filter(b,a,data);
% Plot Frequency Response
freqz(b,a,[],fs);
% Play Audio File
sound(data,fs);
pause(pause_time);
sound(y,fs);
end