function equalizer_play(file_name,C)
    [x,Fs] = audioread(file_name);
    [a,b] = coef(Fs);
    len_wav = 2*Fs;
    Nb = round(length(x)/len_wav);

    y = 0;
    for i=1:floor(Nb)
        in = x((i-1)*len_wav+1:i*len_wav);
        for k=1:5
            b_cur = b{k};
            a_cur = a{k};
            
            y = y + filter(db2mag(C(k))*b_cur,a_cur,in);   
        end
        
        sound(y,Fs);
    end
