function y=ma_filt(N,x_n)
b = (1/N).*ones(1,N);
y = filter(b,1,x_n);
end