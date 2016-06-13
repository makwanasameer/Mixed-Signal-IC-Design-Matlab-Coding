clear all;
close all;
p=[1 -1.25 0.375];
q=[0 1 1];

db=mag2db(abs(0+1j));
disp(db);

zeros=roots(q);
poles=roots(p);

dist(1j,zeros)
dist(1j,poles(1))
dist(1j,poles(2))

HT=tf(q,p)
zplane(q,p);