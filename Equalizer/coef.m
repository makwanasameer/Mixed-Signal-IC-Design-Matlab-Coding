function [a,b] = coef(Fs)
% Create the five IIR Butterworth filters here.
fc = 4000;
% Butterworth Filter
[b1,a1] = butter(10,fc./(Fs/2),'low');
fc1 = [4000 , 8000];
[b2,a2] = butter(5,fc1./(Fs/2),'bandpass');
fc2 = [8000 , 12000];
[b3,a3] = butter(5,fc2./(Fs/2),'bandpass');
fc3 = [12000 , 16000];
[b4,a4] = butter(5,fc3./(Fs/2),'bandpass');
fc4 = 16000;
[b5,a5] = butter(10,fc4./(Fs/2),'high');
% KEEP THIS
% This stores the filter coeffs in a format needed for use by the GUI
a = {a1,a2,a3,a4,a5};
b = {b1,b2,b3,b4,b5};
