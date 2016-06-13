function echofilt(d,h)
%d=1000;
%h=100;
sampling_freq=44100;
T_period=1/sampling_freq;
c=340.29;
r=sqrt((h^2)+((d/2)^2));

M=round(((2*r)-d)/(c*T_period));
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

[data, sampling_freq] = audioread('guitar.wav');
data=data(1:293000);
pause_time = round(length(data)/sampling_freq) + 1;
y = filter(b,a,data);
% Plot Frequency Response
freqz(b,a,[],sampling_freq);
% Play Audio File
sound(data,sampling_freq);
pause(pause_time);

%Increase the speed
sound(y,sampling_freq*1.5);
pause(pause_time);

%Decrease the speed
sound(y,sampling_freq/1.5);
pause(pause_time);

%Reverse the wave
sound(flipud(y),sampling_freq);
pause(pause_time);

%Repeat the audio
%repeat_a=[y;y;y];
%sound(repeat_a,sampling_freq);
%pause(pause_time);

%Echo
%sound(y,sampling_freq);
%pause(pause_time);

%Mixing original with the second sound
[data1, sampling_freq1] = audioread('drums.wav');
data1=data1(1:293000);
z = filter(b,a,data1);
new_mixed=y+z;
sound(new_mixed,sampling_freq1);
pause(pause_time);

[data1, sampling_freq1] = audioread('Voice003.m4a');

y = filter(b,a,data1);

sound(y,sampling_freq1);
end




