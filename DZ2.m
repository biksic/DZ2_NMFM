f=@(x) 5*sin(5*x)+5*cos(5*x)+5*x; 
n=7;
N=2^n;
x=[0:2*pi/N:2*pi*(N-1)/N];
fut=f(x); 

d=55; 
t=0:(2*pi/d):2*pi;

[A,b]=nk_lin_splajn(t,x,fut);
if size(b)==[N,1]
  b=b;
else b=b';
end
[U,S,V]=svd(A,0);
r=rank(S);
alfa= V*(inv(S(1:r,1:r))*(U(:,1:r)'*b));
for i=1:length(t)
  sy(i)=vrij_lin_splajna(t(i),t,alfa);
end

figure(1)
plot(x,fut,'ro');
hold on
plot(t,sy,'b-');
title('Aproksimacija po dijelovima linearnom funkcijom DMNK');
xlabel('x'); ylabel('f(x)');
legend('(x_k,f_k)', 'Po dijelovima linearna funkcija');
hold off
print slika2.pdf

figure(2)
plot(x,fut,'ro');
hold on
plot(t,sy,'b-');
title('Aproksimacija po dijelovima linearnom funkcijom DMNK na intervalu [0,0.5]');
xlabel('x'); ylabel('f(x)');
legend('(x_k,f_k)', 'Po dijelovima linearna funkcija');
xlim([0,0.5]);
hold off
print slika2ogranicena.pdf

x=x';
fut=fut';
t=t';
