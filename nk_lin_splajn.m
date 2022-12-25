function [A, b] = nk_lin_splajn(t, x, y)
%t-vektor cvorova duljine n+1
%x i y vektori podataka duljine m
%najprije treba x i y sortirati da x(i) budu u uzlaznom poretku
n=length(t);
m=length(x);

[x,ind]=sort(x); %fija iz matlaba
y=y(ind); %rasporedujemo y
A=zeros(m,n); %popunjavamo A s nulama

for i=1:m %m duljina od x
    [k]=bintrazenje(x(i), n-1, t); %trazimo interval
    A(i,k)=((t(k+1)-x(i))/(t(k+1)-t(k))); %sa slajda
    A(i,k+1)=((x(i)-t(k))/(t(k+1)-t(k))); %sa slajda
end
b=y';
end