fs = 50e6;
step = 1e3;
ind = 1;
for f_cur = 0:step:2*fs
    f(ind) = f_cur;
    phs(ind) = -pi*f(ind)/fs;
    while(phs(ind) < -pi/2)
        phs(ind) = phs(ind) + pi;
    end
    mag(ind) = 2*abs(cos(pi*f(ind)/fs));
    phs(ind) = rad2deg(phs(ind));
    ind = ind + 1;
end
figure();
subplot(2,1,1);
plot(f/1e6,phs);
ylabel('Degs');
hold on;
title(['fs = ' num2str(fs/1e6) ' MHz']);
subplot(2,1,2);
plot(f/1e6,mag);
xlabel('Freq (MHz)');
ylabel('Mag');