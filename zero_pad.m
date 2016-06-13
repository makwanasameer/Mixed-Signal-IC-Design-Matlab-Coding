function y=zero_pad(x,K)
X_len=length(x);
space_length=X_len+((K-1)*(X_len-1))+(K-1);
y=linspace(0,1,space_length);
y=zeros(1,space_length);
    for i=1:(X_len)
        y(i+(K-1)*(i-1))=x(i);
    end
end