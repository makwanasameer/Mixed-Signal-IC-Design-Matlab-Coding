function equalizer_plot(C,Fs)
    [a,b] = coef(Fs);
    H = 0;
    
    for i=1:5
        H = H + db2mag(C(i))*abs(freqz(b{i},a{i},1024));
    end
    
    f = linspace(0,Fs/2,1024);
    f = f/1000;     % kHz
    plot(f,mag2db(H));
    xlabel('Freq (kHz)');
    ylabel('Magnitude (dB)');
    axis([0 f(end) -21 21]);
    title('Magnitude Response');
    grid on;
